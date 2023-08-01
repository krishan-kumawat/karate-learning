Feature:

  Background:
    * def basePath = 'https://jsonplaceholder.typicode.com'

  Scenario: print and receives args using __arg
    * print 'arg >> ', __arg
    * print 'Id >> ', __arg.Id

