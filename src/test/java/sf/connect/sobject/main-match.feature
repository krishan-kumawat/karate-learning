Feature: match response using predicate

  Background:
    * def res = read('response.json')

  Scenario:
    Given def matcher = read('matcher.json')
    * match res contains matcher

