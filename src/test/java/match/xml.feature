Feature: xml samples and tests

  Scenario: xml empty elements and null
    * def foo = <root><bar/></root>
    # unfortunately XML does not have a concept of a null value
    # empty tags are always considered to have the text value of ''
    * match foo == <root><bar></bar></root>
    * match foo/root/bar == ''
    * match foo/root/bar == '#present'
    # check if a path does not exist
    * match foo/root/nope == '#notpresent'

  Scenario:
    * def search = { number: '123456', wireless: true, voip: false, tollFree: false }
    * def xml = read('soap1.xml')
    * print 'pretty print:', xml
