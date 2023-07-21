Feature: oauth feature
  Background:
    * configure url =  'https://dummyjson.com/auth'
    * def ScenarioEngine = Java.type('com.intuit.karate.core.ScenarioEngine');

  Scenario: can omit url if it configured
    Given path 'login'
    And form field username = 'kminchelle'
    And form field password = '0lelplR'
    When method post
    Then status 200
    * assert response.id == 15

  Scenario: access a token and send it in a new request
    Given path 'login'
    And form field username = 'kminchelle'
    And form field password = '0lelplR'
    When method post
    Then status 200
    * def access_token = response.token

    * path 'RESOURCE'
    And header Authorization = 'Bearer ' + access_token
    When method get
    Then status 404
    * print ScenarioEngine.get().getRequest().url





