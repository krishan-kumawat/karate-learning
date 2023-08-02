Feature:

  Background:
    * call read('commonApi.feature')

  Scenario:
    * def END_POINT = Java.type('PropertiesManager').getProperty('TZ_ENDPOINT');
    * def USER_NAME = Java.type('PropertiesManager').getProperty('TZ_ENDPOINT');
    * def USER_PASS = Java.type('PropertiesManager').getProperty('TZ_ENDPOINT');
    * print 'end point ', END_POINT

    Given def queryObject = 'SELECT NAME FROM Account'
    When def parameters = { soqlQuery: '#(queryObject)', environment: 'tz' }
    Then def queryResult = call query parameters

    * call common