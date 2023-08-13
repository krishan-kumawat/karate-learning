@ignore
Feature: test set-up routines that run only once, similar to how @BeforeAll works

  Background:
    * url demoBaseUrl

    * table kittens
      | name   | age |
      | 'Bob'  | 2   |
      | 'Wild' | 1   |
      | 'Nyan' | 3   |

# note the use of 'callonce' instead of 'call'
    * def result = callonce read('../callarray/kitten-create.feature') kittens


  Scenario Outline: various tests on the cats created

    Given path 'cats'
    When method get
    Then status 200
    And match response[*].name contains '<name>'

    # even though cucumber will re-run the 'Background:' section for each row in the 'Examples' below,
    # kittens will be created by 'kitten-create.feature' only once

    Examples:
      | name |
      | Bob  |
      | Nyan |