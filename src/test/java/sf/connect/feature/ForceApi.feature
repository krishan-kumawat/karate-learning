Feature:

  @query
  Scenario: Query SOQL
    Given call read('@prepareSessionToken')
    And url ENDPOINT + "/services/data/v56.0/query/?q=" + Java.type("java.net.URLEncoder").encode(soqlQuery, "UTF-8")
    And header Authorization = 'Bearer ' + SESSION
    And header X-PrettyPrint = '1'
    Then method GET
    And status 200

  @prepareSessionToken
  Scenario: Create API session token
    * def environment = environment.toUpperCase().trim()
    * def session_params = { environment: '#(environment)' }
    * if (!Java.type('java.lang.System').getProperty(environment+"Session")) karate.call('this:/SessionToken.feature@cacheForceApiSessionToken', session_params)
    * def SESSION = Java.type('java.lang.System').getProperty(environment+"Session")
    * def ENDPOINT = Java.type('PropertiesManager').getProperty(environment + "_ENDPOINT")