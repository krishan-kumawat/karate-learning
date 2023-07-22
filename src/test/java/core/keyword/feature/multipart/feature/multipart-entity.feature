Feature: Use this for multipart content items that don't have field-names.
  Scenario:
    Given path 'v2', 'documents'
    And multipart entity read('foo.json')
    And multipart field image = read('bar.jpg')
    And header Content-Type = 'multipart/related'
    When method post
    Then status 201