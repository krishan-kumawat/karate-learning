Feature:

  Background:
    * def access_token = '00D2w00000RIIrf!AR0AQFdRavhoEsDCH0jdq5NkHFSh5Tt_j7WrUmn8NqghhAV761efdiV4kzHLABjzk.werTKn5vl1qD8ZVTv2efm1TAAAEJAp'

  Scenario: call salesforce rest api
    Given url 'https://resourceful-koala-tl33au-dev-ed.trailblaze.my.salesforce.com/services/data/v56.0/sobjects/account'
    And header Authorization = 'Bearer '+ access_token
#    And header Accept = 'application/json'
    And request { Name: 'Karate Account' }
    When method post
    Then status 201
    * print response