Feature:

  Background:
    * url basePath = 'https://jsonplaceholder.typicode.com'

  Scenario:
    Given path urlPath
    And method get
    Then status 200
