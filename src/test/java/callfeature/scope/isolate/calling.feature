Feature: isolate scoping

  Scenario:
    * def a = { a:  'ABC' }
    * def b = { b:  'XYZ' }
    * def calll = call read('called.feature') a,b
    * print 'calling a :: ', a