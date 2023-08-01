Feature: array shortcuts

  Scenario:
    * def foo = ['bar', 'baz']

  # should be an array
      * match foo == '#[]'

  # should be an array of size 2
      * match foo == '#[2]'

  # should be an array of strings with size 2
      * match foo == '#[2] #string'

  # each array element should have a 'length' property with value 3
      * match foo == '#[]? _.length == 3'

  # should be an array of strings each of length 3
      * match foo == '#[] #string? _.length == 3'

  # should be null or an array of strings
      * match foo == '##[] #string'

    Scenario: array size validation
      * def foo = ['bar', 'baz']
      * def dm = { a:  8, b: 10 }
      * def num = [0]
#      * match foo == '#[]'


#   num size should be grater then 0
      * match num == '#[_ > 0]'

      * match dm.a == '#? _ > 1'

      * def headerReq =
      """
        {
          name: 'krish',
          num: [1],
        }
      """




  Scenario:
    * def response =
      """
        {
          name: 'krish',
        }
      """

    * match response.op == '##[_ > 0]'









