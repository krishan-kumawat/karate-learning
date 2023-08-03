Feature: shared scoping

  Scenario: in this scoping vars are overridable, here a and b values are changed by called.feature
    * def a = 'A'
    * def b = 'B'
    * call read('called.feature')
    * print 'a in calling :: ', a
    * print 'a in calling :: ', b
    * match a == '1'
    * match b == '2'

