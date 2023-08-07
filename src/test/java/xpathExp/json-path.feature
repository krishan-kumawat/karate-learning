Feature:
  Background:
    * def response = read('dummy.json')

  Scenario:
    * def authors = $..author
    * print 'authors :: ', authors