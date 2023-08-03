Feature:

  Background:
    * url baseUrl = 'https://www.dataaccess.com/webservicesserver/NumberConversion.wso'

  @word
  Scenario:
    Given header Content-Type = 'text/xml'
    And request
    """
      <?xml version="1.0" encoding="utf-8"?>
      <soap:Envelope xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
        <soap:Body>
          <NumberToWords xmlns="http://www.dataaccess.com/webservicesserver/">
            <ubiNum>500</ubiNum>
          </NumberToWords>
        </soap:Body>
      </soap:Envelope>
    """
    When method post
    Then status 200
    And print 'response ', response
    And def words =  /Envelope/Body/NumberToWordsResponse/NumberToWordsResult
    * print 'words  ', words
    And match /Envelope/Body/NumberToWordsResponse/NumberToWordsResult == 'five hundred'
#    And match response /Envelope/body/NumberToWordsResponse/NumberToWordsResult == 'five hundred'

  Scenario:
    * url 'http://www.dneonline.com/calculator.asmx'
    Given request
    """
    <?xml version="1.0" encoding="utf-8"?>
    <soap:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soap="http://schemas.xmlsoap.org/soap/envelope/">
      <soap:Body>
        <Add xmlns="http://tempuri.org/">
          <intA>2</intA>
          <intB>3</intB>
        </Add>
      </soap:Body>
    </soap:Envelope>
    """
    When soap action 'http://tempuri.org/Add'
    Then status 200
    And match /Envelope/Body/AddResponse/AddResult == '5'
    And print 'response: ', response