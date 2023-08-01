Feature: https://github.com/karatelabs/karate/blob/master/karate-demo/src/test/java/demo/calldynamic/call-dynamic-json.feature

  Background:
    * def creator = read('kitten-create.feature');

    * def createArray =
    """
      function(itemCount) {
        let kitten = []
        for (var i = 0; i < itemCount; i++) {
          kitten.push({ name: 'Kit' + i });
        }
        return kitten;
      }

    """

  Scenario:
    * def kittens = call createArray 5
    * print 'kittens ', kittens
    * def kittenCount = kittens.length
    * match kittenCount == 5

#    kitten-create will run 5 times bcz kittens length is 5
    Given call creator kittens
