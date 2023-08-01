Feature:

  Scenario:
#    * def products = read('../jsondata/products.json');
    * def products = read('classpath:schemavalidation/jsondata/products.json');
    * print 'products ', products


  Scenario:
    * def warehouseLocation = { latitude: '#number', longitude: '#number' }
    * def productStructure =
    """
    {
      id: '#number',
      name: '#string',
      price: '#number? _ > 0',
      tags: '##[_ > 0] #string',
      dimensions: {
        length: '#number',
        width: '#number',
        height: '#number'
      },
      warehouseLocation: '##(warehouseLocation)'
    }
    """

    * def products = read('classpath:schemavalidation/jsondata/products.json');
    * print products[0]
    * match products[0] == productStructure

  Scenario:
    * def a = { a : '#number'}
    * def b = { a :  10 }
    * match b == a

  Scenario: array with string
    * def a = ['kri', 'joh', 'Doe']
    * def b = ['krish', 'john', 'Doe', 111]
    * match a == '#[_ > 2 ] #string?'
    * match b != '#[_ > 2 ] #string?'
    * match a == '#[] #string? _.length == 3'

  Scenario: array, length validation
    * def a = ['111']
    * match a == '#[]? _.length > 2'

