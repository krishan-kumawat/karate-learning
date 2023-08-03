Feature:

  Scenario:
    * def com = call read('soap-call.feature@word')
    * print 'com ', com
    * print 'com ', com.response
    * def res = com.response
    * def numword = $res/Envelope/Body/NumberToWordsResponse/NumberToWordsResult
    * print numword