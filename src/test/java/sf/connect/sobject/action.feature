Feature: here we are using action parameters

  Background:
    * def forceApi = read('forceApi.feature@forceApi')

  Scenario: call query action
    Given def args =
    """
    {
      environment: 'tz',
      soqlQuery: "SELECT Id,Name FROM ACCOUNT"
    }
    """
    When def res = call forceApi { action: 'query', args: '#(args)' }
    And print 'ress ', res

  Scenario: call get action
    Given def args =
    """
    {
      environment: "tz",
      soqlQuery: "SELECT Id,Name FROM ACCOUNT",
      objectType: "User",
      objectId: "0052w00000F8q6CAAR"
    }
    """
    When def res = call forceApi { action: 'get', args: '#(args)' }
    And print 'ress ', res




