@ignore
Feature:

  Scenario:
    Given url someUrlFromConfig
    And path 'cats'
    And request { name: '#(name)', age: '#(age)' }
    When method post
    Then status 200