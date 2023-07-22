Feature: report verbosity manage HTML report will be generate or not

  Background:
    * configure report = { showLog: true, showAllSteps: false }
    * url 'https://dummyjson.com'
#    showAllSteps = If false, any step that starts with * instead of Given, When, Then etc. will not appear in the HTML report. The print step is an exception. Default true.

  Scenario:
    Given path 'products'
    And path 1
    When method get
    Then status 200
    * def test = 'test'
#       test variable value will not be appear in html report bcz showAllSteps is false
    * print response

  Scenario: we can 'reset' default settings by using the following short-cut
    * configure report = true
    Given path 'products'
    And path 1
    When method get
    Then status 200
    * def test = 'test'

  Scenario: The following short-cut is also supported which will disable all logs
    * configure report = false
    Given path 'products'
    And path 1
    When method get
    Then status 200
    * def test = 'test'

  @report=false
  Scenario: above decorator completely hide from the HTML reports.
    * configure report = false
    Given path 'products'
    And path 1
    When method get
    Then status 200
    * def test = 'test'