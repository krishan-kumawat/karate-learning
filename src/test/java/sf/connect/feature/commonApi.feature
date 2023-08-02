Feature:

  Scenario:
    * def query = read('ForceApi.feature@query')

    Given def queryObject = 'SELECT NAME FROM Account'
    When def parameters = { soqlQuery: '#(queryObject)', environment: 'tz' }
    Then def queryResult = call query parameters
