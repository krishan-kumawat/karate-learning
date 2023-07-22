Feature: oauth example

  Background:
    * url 'https://dummyjson.com/auth'

  Scenario:
    Given path 'login'
    When form field username = 'kminchelle'
    And form field password = '0lelplR'
    And method post
    Then status 200
    * assert response.id == 15

  Scenario: call java class function
    * def Signer = Java.type('core.keyword.feature.oauth.service.Signer')
    * def params =
    """
    {
      'userId': '399645532',
      'os':'browser',
      'client_key': '3c2cd3f3',
      'token': '141a649988c946ae9b5356049c316c5d-838424771',
      'token_client_salt': 'd340a54c43d5642e21289f7ede858995'
    }
    """
    * print Signer.sign('382700b563f4', params)







