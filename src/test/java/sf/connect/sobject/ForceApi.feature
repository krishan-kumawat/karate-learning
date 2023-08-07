Feature:

  @getsObject
  Scenario: Query SOQL
    Given call read('@prepareSessionToken')
    And url ENDPOINT + "/services/data/v56.0/sobjects/" + objectType + "/" + objectId
    And header Authorization = 'Bearer ' + SESSION
    And header X-PrettyPrint = '1'
    When method GET
    Then status 200

  @prepareSessionToken
  Scenario: Create API session token
    * def environment = environment.toUpperCase().trim()
    * def session_params = { environment: '#(environment)' }
    * if (!Java.type('java.lang.System').getProperty(environment+"Session")) karate.call('this:/SessionToken.feature@cacheForceApiSessionToken', session_params)
    * def SESSION = Java.type('java.lang.System').getProperty(environment+"Session")
    * def ENDPOINT = Java.type('PropertiesManager').getProperty(environment + "_ENDPOINT")

  @forceApi
  Scenario: Call request salesforce operations by action
  // action  : determine which kind of salesforce request will be executed [query | get | create | update].
  // args    : parameters to be used within our requests (environment, soqlQuery, objectType, objectId, payload).
    * def result = ""
    * if(action == 'query') { karate.set('result', karate.call('classpath:sf/connect/feature/ForceApi.feature@query', args)); karate.set('res',result.response); }
    * if(action == 'get') { karate.set('result', karate.call('@getsObject', args)); karate.set('result',result.response); }
#    * if(action == 'create') { karate.set('result', karate.call('this:ForceAPI.feature@createSObject', args)); karate.set('result',result.response); }
#    * if(action == 'update') { karate.set('result', karate.call('this:ForceAPI.feature@updateSObject', args)); }