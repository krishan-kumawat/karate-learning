Feature: match

  Scenario:
    Given def temperature = { celsius: 100, fahrenheit: 212 }
    And def temp = { data:  'data' }
#    * print $.data
    Then match temperature == { celsius: '#number', fahrenheit: '#? _ == $.celsius * 1.8 + 32' }
# when validation logic is an 'equality' check, an embedded expression works better
    Then match temperature contains { fahrenheit: '#($.celsius * 1.8 + 32)' }

  Scenario: check scenario
    * def hello = 'Hello World!'
    * match hello contains 'World'
    * match hello !contains 'blah'

    Scenario:
  Scenario: recurse nested json
    * def original = { a: 1, b: 2, c: 3, d: { a: 1, b: 2 } }
    * def expected = { a: 1, c: 3, d: { b: 2 } }
    * match original contains deep expected

  Scenario: recurse nested array
    * def original = { a: 1, arr: [ { b: 2, c: 3 }, { b: 3, c: 4 } ] }
    * def expected = { a: 1, arr: [ { b: 2 }, { c: 4 } ] }
    * match original contains deep expected

  Scenario: match each
    * def data = { foo: [{ bar: 1, baz: 'a' }, { bar: 2, baz: 'b' }, { bar: 3, baz: 'c' }]}
    * match each data.foo == { bar:  '#number', baz:  '#string' }

    * match data.foo contains { bar:  1, baz:  'a'}

    * match each data.foo contains { bar:  '#number'}
    * match each data.foo contains { bar: '#? _ != 4' }

    * def isAbc = function(x) { return x == 'a' || x == 'b' || x == 'c' }
    * match each data.foo contains { baz: '#? isAbc(_)' }

    * def isXabc = function(x) { return x.baz == 'a' || x.baz == 'b' || x.baz == 'c' }
    * match each data.foo == '#? isXabc(_)'


  Scenario:
    Given def json =
    """
    {
      "hotels": [
        { "roomInformation": [{ "roomPrice": 618.4 }], "totalPrice": 618.4  },
        { "roomInformation": [{ "roomPrice": 679.79}], "totalPrice": 679.79 }
      ]
    }
    """
      Then match each json.hotels contains { totalPrice: '#? _ == _$.roomInformation[0].roomPrice' }
  # when validation logic is an 'equality' check, an embedded expression works better
      Then match each json.hotels contains { totalPrice: '#(_$.roomInformation[0].roomPrice)' }
