Feature:
#  if not configured, 'retry' defaults to
#  { count: 3, interval: 3000 } (milliseconds)

  Background:
    * configure retry = { count: 5, interval: 0 }
    *  url baseUrl = 'https://dummyjson.com/'

  Scenario:
    Given url baseUrl
    When path 'products'
    When path 1
    And retry until responseStatus == 200 && response.id == 1
    And method get
    Then status 200
    * def matcher = responseStatus == 200 ? karate.read('matcher.json') : {}
    * print response
    * match response == matcher


