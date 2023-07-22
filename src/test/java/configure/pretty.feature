Feature: pretty feature

  Background:
    * url 'https://dummyjson.com'
    * configure logPrettyRequest = true
    * configure logPrettyResponse = true

  Scenario: print response and request prettier
    Given path 'products'
    And path 1
    When method get
    Then status 200
