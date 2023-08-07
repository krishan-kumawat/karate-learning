Feature:

  Scenario:
    * def original = { key: 'value' }
    * copy foo = original
    * call read('called.feature')
    * match original == { key : 'value' }
    * match foo == { key: 'changed' }

  Scenario: clone should be 'deep' and work even for nested data
    * def temp = call read('copy-called-nested.feature')
    * def a = temp.root
    * copy b = a
    * set b.name.name = 'copy'
    * match b.name.name == 'copy'
    * match a.name.name == 'inner'


  Scenario: clone should be 'deep' and work even for nested data
    Given url 'https://jsonplaceholder.typicode.com/users'
    When method get
    Then status 200
    Then response $ = {}
    * print 'res ', response
    * response $
    * print 'res ', $

