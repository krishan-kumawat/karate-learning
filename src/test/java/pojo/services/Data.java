package pojo.services;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

//@JsonIgnoreProperties(ignoreUnknown = true)
public class Data {
//    @JsonProperty("id")
    private Integer Id;

//    @JsonProperty("name")
    private String Name;

    public String getName() {
        return Name;
    }

    public Integer getId() {
        return Id;
    }

    public void setName(String name) {
        Name = name;
    }

    public void setId(Integer id) {
        Id = id;
    }
}
