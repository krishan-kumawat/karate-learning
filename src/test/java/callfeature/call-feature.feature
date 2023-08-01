Feature:

  Background:
#    * def baseUrl = 'https://jsonplaceholder.typicode.com'


  Scenario: calling using objects
    * def result = call read('called-normal.feature') { path: 'users', id: 1 }
#    * print result

  @ignore
  Scenario: args can be only [], {} array and object
    * print 'if you are calling a feature into another, you have to send all the variables which being are used into called feature as args if not then must be defined into called feature file.'


  Scenario: passing multiple parameters
    * def ctmPath = ['users']
    * def result = call read('called-feature-2.feature') { path: 'users2', id: 2 },ctmPath
    * print result.response

  Scenario: arg
    * def result = call read('called-arg.feature') { Id: 101, Path: 'users' }

  Scenario: called features will inherit parent scope this variable will be available in the called feature
    * def urlPath = 'users'
    * def result = call read('call-api.feature')
    * print result.response
    * def len = result.response.length
    * match len == 10


