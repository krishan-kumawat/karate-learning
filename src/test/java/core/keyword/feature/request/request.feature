Feature: request Keyword
  Background:
    Given def basePath = 'http://localhost:8000'
#    /users/register

  Scenario: post request without params
    Given url basePath
    And path 'users'
    And path 'register'
    When method post
    Then status 400
    * print response
    * print $ = response.message[0]
    * assert $ == 'firstName must be a string'

  Scenario: post request with params
    Given url basePath
    And request read('request.json')
    And path 'users'
    And path 'register'
    When method post
    Then status 400
    Then match response.message[0] == 'profile already exist'

    @ignore
    Scenario: we can upload a image also (can send binary data)
      Given path 'upload'
      And request read('my-image.jpg')
      When method put
      Then status 200




