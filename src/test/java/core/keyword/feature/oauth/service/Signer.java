package core.keyword.feature.oauth.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import static org.apache.commons.codec.digest.DigestUtils.md5Hex;
import static org.apache.commons.codec.digest.DigestUtils.sha256Hex;

public class Signer {

    public static Map<String, String> sign(String token, Map<String, String> params) {
        List<String> list = new ArrayList();
        String tokenClientSlat = "";
        for (Map.Entry<String, String> entry : params.entrySet()) {
            String key = entry.getKey();
            if (key.equals("token_client_salt")) {
                tokenClientSlat = entry.getValue();
            }
            String paramString = key + "=" + entry.getValue();
            list.add(paramString);
        }
        Collections.sort(list);
        StringBuilder sb = new StringBuilder();
        for (String s : list) {
            sb.append(s);
        }
        sb.append(token);
        String sig = md5Hex(sb.toString());
        String tokenSig = sha256Hex(sig + tokenClientSlat);
        params.put("sig", sig);
        params.put("__NStokensig", tokenSig);
        return  params;
    }

}
