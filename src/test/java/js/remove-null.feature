Feature: combine the optional marker with an embedded expression

  Scenario: get removed key
    * def a = { a:  'Hello', b:  null, c:  null}
    * def b = { a: '#(a.a)', b: '#(a.b)', c: '##(a.c)' }
    * print b
    * match b == {"a": "Hello", "b": null  }

  Scenario: suppress the default behavior of replacing placeholders
    * def dogSchema = { id: '#string', color: '#string' }
    * def schema1 = ({ id: '#string', name: '#string', dog: '##(dogSchema)' })
    * def schema2 = { id: '#string', name: '#string', dog: '##(dogSchema)' }
    * print schema1
    * print schema2
    * def schema1result = { id:  '101', name:  'krish'  }
    * match schema1result == schema1
    * match schema2 == { id:  '#string', name:  '#string', dog: { id: '#string', color: '#string' }  }

  Scenario: ##null
    * def a = { a:  '##(null)'}
    * def b = { a:  '##null'}
    * print a, b
    * print a != b
    * match a == {}
    * def bres = { a: null }
    * match bres == b
#    * match b == bres // why it's not matched