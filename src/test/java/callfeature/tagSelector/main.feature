Feature:

  Scenario: calling tag selector
#  the tag does not need to be in the @key=value form
  * call read('my-signin.feature@someScenarioName')


  Scenario: calling other scenario from same feature file
    * call read('@generateToken')
#    * call generateToken  # can't call like this 

#    Note that you would typically want to use the @ignore tag for such cases.
  @generateToken @ignore
  Scenario: generating access token
    * print 'generating access token'

