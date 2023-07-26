Feature: self-validation
  Background:
    * def min = 1
    * def max = 12

  Scenario:
    * def date = { month: 3 }
    * match date == { month: '#? _ > 0 && _ < 13' }
#    key must be same as actual data

  Scenario: for multiple keys
    * def date = { month: 3, year: 12 }
    * match date == { month: '#? _ > 0 && _ < 13', year: '#? _ > 0 && _ < 13' }
#    for all the keys must follow self-validation

  Scenario: use variables
    * def date = { month: 3 }
    * match date == { month:  '#? _ >= min && _ <= max'}

  Scenario: use js function
    * def validate = read('validate.js')
    * def date = { month: 1 }
    * match date == { month:  '#? validate(_)' }

  Scenario: coerced to numbers
    * def date = { month: '1' }
    * match date == { month: '#? _ > 0' }
#    * match date == { month: '#number? _ > 0' }
# but this 'combined form' will fail, which is what we want
