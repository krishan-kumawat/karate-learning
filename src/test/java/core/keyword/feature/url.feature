Feature: url features
  Background:
    Given def basePath = 'https://fakestoreapi.com/'
    And def customPath = 'products'


  Scenario: url with path
    Given url basePath
    And path 'products'
    Given method get
    When status 200
    Then print response

  Scenario: url can embed with variable
    Given url basePath + '/' + customPath
    Given method get
    When status 200
    Then match response[0].id == 1

  Scenario: configure used to persist any data
    Given configure url = basePath + '/' + customPath
    Given method get
    When status 200
    Then match response[0].id == 1

  Scenario: we can change url
    Given url basePath
    And path customPath
    And path 1
    And method get
    When status 200
    Then match response.id == 1

  Scenario: JavaScript enthusiasts may prefer variable interpolation using backticks
    Given url `${basePath}/products`
    Given method get
    When status 200
    Then assert response.length == 20