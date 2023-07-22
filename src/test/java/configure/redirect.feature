Feature:

  Background:
    * configure report = { showLog: true, showAllSteps: false }
    * url 'https://dummyjson.com'
#    disable print when env is not dev
#    * configure printEnabled = false
    * def message = 'hi!'
#    /posts?skip=5


  Scenario: printEnabled = false
#  if printEnabled = false
    * print 'print disabled ', message

  Scenario: check param
    Given path 'posts'
    And param skip = 33
    When method get
    Then status 200
#    * print header
    * print 'header , ',  karate.response.headers['access-control-allow-origin']
    * print response

  @ignore
  Scenario: get redirects are followed by default
    Given path 'redirect'
    And param foo = 'bar'
    When method get
    Then status 200
    And match response == { foo: ['bar'] }

  @ignore
  Scenario: get redirects can be disabled
    * configure followRedirects = false
    Given path 'redirect'
    When method get
    Then status 302
    And match header Location == demoBaseUrl + '/search'

    * def location = responseHeaders['Location'][0]

    Given url location
    And param foo = 'bar'
    When method get
    Then status 200
    And match response == { foo: ['bar'] }

  @ignore
  Scenario: post redirects are followed by default
    Given path 'redirect'
    And param foo = 'bar'
    And request {}
    When method post
    Then status 200
    And match response == { foo: ['bar'] }

  @ignore
  Scenario: post redirects can be disabled
    * configure followRedirects = false
    Given path 'redirect'
    And request {}
    When method post
    Then status 302
    And match header Location == demoBaseUrl + '/search'

    * def location = responseHeaders['Location'][0]

    Given url location
    And param foo = 'bar'
    When method get
    Then status 200
    And match response == { foo: ['bar'] }



