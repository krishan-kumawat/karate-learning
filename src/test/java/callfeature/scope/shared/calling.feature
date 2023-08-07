Feature: shared scoping

  Scenario: in this scoping vars are overridable, here a and b values are changed by called.feature
    * def a = 'A'
    * def b = 'B'
    * call read('called.feature')
    * print 'a in calling :: ', a
    * print 'a in calling :: ', b
    * match a == '1'
    * match b == '2'


  Scenario: The JS API allows you to do this, but this will not be Shared Scope
    * karate.call('called.feature')
#    * print a


