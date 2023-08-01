Feature:

  Background:
    * def basePath = 'https://jsonplaceholder.typicode.com'
#    * def ctmPath = ['if not defined']


  Scenario: run from another feature file
    * print 'path 1', path
    * print 'id 1', id

  Scenario: 2nd run from another feature file
    * def checkString = function(str){ return str!= '' && str!= undefined; }
    * print 'path 2', path
    * print 'id 2', id

