Feature:
  Scenario:
    * def name = 'old'
    * print 'name >> ', name


  Scenario:
    Given url 'https://jsonplaceholder.typicode.com'
    And path 'users', 1
    When method get
    Then status 200
    And print response
