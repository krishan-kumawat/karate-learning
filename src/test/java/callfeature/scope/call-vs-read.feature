@ignore
Feature:


  Scenario: Shared Scope, and the login variable can be re-used
    * def login = read('login.feature')
    * call login

#    short-cut for the above
    * call read('login.feature')

  Scenario: Note how using read() for a JSON file returns data - not "callable" code, and
  here it is used as the call argument
    * def credentials = read('credentials.json')
    * def login = read('login.feature')
    * call login credentials

    * print 'Note >> ', You can do this in theory, but it is not as readable as the above
    * call read('login.feature') read('credentials.json')

  Scenario: The JS API allows you to do this, but this will not be Shared Scope
    * karate.call('login.feature')

  Scenario: call result assigned to a variable and not Shared Scope
    * def result = call read('login.feature')
#  exactly equivalent to the above !
    * def result = karate.call('login.feature')

  Scenario: if you need conditional logic and Shared Scope, add a boolean true first argument
#    * if (cond) karate.call(true, 'login.feature')
    * karate.call(true, 'classpath:callfeature/scope/shared/called.feature')
    * print 'A >> ', a

#    like the above, but with a call argument
    * def credentials = read('credentials.json')
    * def result = call read('login.feature') credentials

    * def credentials = read('credentials.json')
    * def result = karate.call('login.feature', credentials)

  Scenario: using the call keyword makes passing an in-line JSON argument more "readable"
    * def login = read('login.feature')
    * def result = call login { user: 'john', password: 'secret' }

  Scenario: Since "read" happens to be a
  function (that takes a single
  string argument), this has the effect
  of loading all keys in the JSON file
  into Shared Scope as variables !
  This can be sometimes handy.

    * call read 'credentials.json'



