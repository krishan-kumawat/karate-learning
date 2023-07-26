Feature:
  Scenario:
    * def numbers = [1, 2, 3, 4]
    * def findNum = 2
    * def foundAt = []
    * def fun = function(x, i){ if( x == findNum ) { karate.appendTo(foundAt, i)}}
    * karate.forEach(numbers, fun)
    * match foundAt == [1]

    Scenario:
      * def json = { foo: 'world', hey: 'ho', zee: [1, 2, 3] }
      * remove json.hey
      * match json == { foo: 'world', zee: [1, 2, 3] }
      * remove json $.zee[1]
      * match json == { foo: 'world', zee: [1, 3] }