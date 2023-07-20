Feature: get apis test feature
  Scenario:  get users json
    Given url 'https://fakestoreapi.com/users'
    And method get
#    Then def res =  response
    * print response

  Scenario:  print response
    Given url 'https://fakestoreapi.com/users'
    And method get
#    Then def res =  response
    * print response[0]

  Scenario:  print response
    Given url 'https://fakestoreapi.com/users'
    And method get
    * match response[0].address.city == 'kilcoole'