Feature:

  @cacheForceApiSessionToken
  Scenario: Store sessions tokens into a variable given the environment
    * def USERNAME_VALUE = Java.type('PropertiesManager').getProperty(environment + "_USERNAME")
    * def PASSWORD_VALUE = Java.type('PropertiesManager').getProperty(environment + "_PASSWORD")
    * def ENDPOINT_VALUE = Java.type('PropertiesManager').getProperty(environment + "_ENDPOINT")
    Given url ENDPOINT_VALUE + '/services/Soap/u/56.0'
    And header Content-Type = 'text/xml'
    And header SOAPAction = 'login'
    And header charset = 'UTF-8'
    And request
  """
    <?xml version="1.0" encoding="utf-8" ?>
    <env:Envelope xmlns:xsd="http://www.w3.org/2001/XMLSchema"
      xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
      xmlns:env="http://schemas.xmlsoap.org/soap/envelope/">
      <env:Body>
        <n1:login xmlns:n1="urn:partner.soap.sforce.com">
          <n1:username>#(USERNAME_VALUE)</n1:username>
          <n1:password>#(PASSWORD_VALUE)</n1:password>
        </n1:login>
      </env:Body>
    </env:Envelope>
  """
    When method POST
    Then status 200
    * def SESSION_VALUE = $response//loginResponse//result//sessionId
    * Java.type('java.lang.System').setProperty(environment + "Session", SESSION_VALUE);