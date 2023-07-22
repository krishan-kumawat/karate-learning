Feature: demo karate's equivalent of before and after hooks
  note that 'afterScenario' / 'afterFeature' if set up using 'configure'
  is not supported within features invoked using the 'call' or 'callonce' keywords

  Background:
    * configure report = { showLog : true, showAllSteps: false }
    * def foo = 'hello'
    * configure afterScenario =
    """
      function() {
        karate.log('afterScenario Name : ', karate.scenario.name)
        karate.log('after-scenario.feature : ', { caller : karate.feature.fileName })
      }
    """

    * configure afterFeature = function(){ karate.call('after-feature.feature'); }

  Scenario: run afterScenario
    * print foo


  Scenario Outline: outline must follow by examples
    * print <bar>

    Examples:
      | bar     |
      | foo + 1 |
      | foo + 2 |

  Scenario: 'after' hooks do not apply to called features
    # 'afterScenario' and 'afterFeature' only work in the "top-level" feature
    #  and are NOT supported in 'called' features
    * def result = call read('called.feature')


