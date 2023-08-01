@ignore
Feature:
  Scenario:
    * table kittens
      | name   | age |
      | 'Bob'  |   2 |
      | 'Wild' |   1 |
      | 'Nyan' |   3 |

    * def result = call read('cat-create.feature') kittens
    * def created = $result[*].response
    * match each created == { id: '#number', name: '#string', age: '#number' }
    * match created[*].name contains only ['Bob', 'Wild', 'Nyan']