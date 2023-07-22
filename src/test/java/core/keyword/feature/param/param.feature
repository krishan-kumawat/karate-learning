Feature: request Keyword
  Background:
    Given def basePath = 'http://localhost:8000'
    * def ScenarioEngine = Java.type('com.intuit.karate.core.ScenarioEngine');

  Scenario:
    Given url basePath
    And param name = "krishan"
    When method get
    Then status 404
    * print response
    * print 'Request Url ', ScenarioEngine.get().getRequest().url

  Scenario: Multi-value params are also supported
    Given url basePath
    And param name = ["Krishan", "akash"]
    When method get
    Then status 404
    * print 'Request Url ', ScenarioEngine.get().getRequest().url


  Scenario: Multi-value params are also supported
    Given url basePath
    And params { searchBy: 'client', active: true, someList: [1, 2, 3] }
    When method get
    Then status 404
    * print 'Request Url ', ScenarioEngine.get().getRequest().url

  Scenario: Multi-value params are also supported
    Given url basePath
    And header Accept = 'application/json'
    And params { searchBy: 'client', active: true, someList: [1, 2, 3] }
    When method get
    Then status 404
    * print 'Request Url ', ScenarioEngine.get().getRequest().url

    Scenario: print cookies
      Given url basePath
      And cookie name = 'temp'
      When method get
      Then status 404
      * print responseCookies

      Scenario: pass form data
        Given url 'https://dummyjson.com/auth/login'
        And form field username = 'kminchelle'
        And form field password = '0lelplR'
        When method post
        Then status 200
        * assert response.id == 15
        * assert response.email == 'kminchelle@qq.com'
