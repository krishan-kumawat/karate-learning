Feature:

  Scenario:
    * def cat =
    """
    {
      name: 'Billie',
      kittens: [
        { id: 23, name: 'Bob' },
        { id: 42, name: 'Wild' }
      ]
    }
    """
  # find single kitten where id == 23
      * def bob = get[0] cat.kittens[?(@.id==23)]
      * print 'bobo ', bob
      * print 'kittens ', get[0] cat.kittens[?(@.id==23)]
      * match bob.name == 'Bob'

  # using the karate object if the expression is dynamic
#      * def temp = karate.jsonPath(cat, "$.kittens[?(@.name=='" + bob.name + "')]")
#      * match temp[0] == bob

  # or alternatively
#      * def temp = karate.jsonPath(cat, "$.kittens[?(@.name=='" + bob.name + "')]")[0]
#      * match temp == bob