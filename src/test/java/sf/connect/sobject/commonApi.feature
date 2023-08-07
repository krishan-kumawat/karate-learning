Feature: calling force-api feature

  Scenario:
    * def getsObject = read('ForceApi.feature@getsObject')

    When def parameters = { objectType: 'user', objectId: '0052w00000F8q6CAAR', environment: 'tz' }
    Then def queryResult = call getsObject parameters
    And print 'res ', queryResult.response
    queryResult.response




