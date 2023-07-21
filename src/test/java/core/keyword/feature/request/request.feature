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
    And print responseStatus
    Then assert responseStatus == 400 || responseStatus == 401

  @ignore
    Scenario: we can upload a image also (can send binary data)
      Given path 'upload'
      And request read('my-image.jpg')
      When method put
      Then status 200

  @ignore
    Scenario: check a range of status
      Given path 'url'
      * match [200, 201, 204] contains responseStatus
      * assert responseStatus >= 200


    Scenario: karate.range()
      Given url basePath
      And path 'users'
      And path 'register'
      When method post
      Then match karate.range(400, 401) contains responseStatus


  Scenario: check response time
    Given url basePath
    And path 'users'
    And path 'register'
    When method post
    * print responseTime
    * assert responseTime < 3

  Scenario: pass response to the service class
    Given url basePath
    And path 'users'
    And path 'register'
    When method post
    Then status 400

    * def printJson =
    """
      function (hello){
        var Parser = Java.type('core.keyword.feature.request.services.ParseJson');
        var parseData = new Parser();
        parseData.printJson(hello);
      }
    """
    * printJson("hello")


  Scenario:
    * def main =
     """
     function() {
       var Demo = Java.type('javafiles.Demo');
       var sdf = new Demo();
       return sdf.printText() // '.getTime()' would also have worked instead of '.time'
     }
     """
    * assert main() != 'Interopp'
