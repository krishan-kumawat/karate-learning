Feature:

  Scenario:
    * def temp1 = 'John'
#  This is wrong
#    * def temp2 = { name: "Hello #(temp1)" }

    * def temp2 = { name:  '#("Hello " + temp1)'}

    * print temp2