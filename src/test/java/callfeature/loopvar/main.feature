Feature: calling another feature file in a loop

  Background:
#    * url demoBaseUrl

    * table kittens
      | name       | age |
      | 'Bob'      | 2   |
      | 'Wild'     | 1   |
      | 'Nyan'     | 3   |
      | 'Keyboard' | 5   |
      | 'LOL'      | 3   |
      | 'Ceiling'  | 2   |

    * def result = call read('called.feature') kittens
    * print 'result ', result
# use json-path to 'un-pack' the array of kittens created
    * def created = $result[*].response
    * print 'created ', created
# which is not even needed for most data-driven assertions
#    * match created[*].name == $kittens[*].name

  Scenario: