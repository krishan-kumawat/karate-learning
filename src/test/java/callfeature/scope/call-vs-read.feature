@ignore
Feature:


  Scenario: Shared Scope, and the login variable can be re-used
    * def login = read('login.feature')
    * call login

#    short-cut for the above
    * call read('login.feature')
