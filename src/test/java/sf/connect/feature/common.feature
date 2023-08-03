Feature:

  @one
  Scenario:
    Given call read('@two')
    Then print 'Hello, ', Name

  @two @ignore
  Scenario:
    * def Name = 'Krish'