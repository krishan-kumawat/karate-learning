Feature: pojo

  Scenario:
    Given def data = { Id: 123, Name: 'krish' }
#    * def Pojo = Java.type('pojo.services.Data')

    * def obj = karate.toBean(data, 'pojo.services.Data')
    * print 'name , ', obj.getName()
    * assert obj.id == 123
    * print 'obj ', obj
    * def Pojo = Java.type('pojo.services.Data')
    * def pojo = new Pojo()
    * match pojo.id == null
#    * match json pojo == { foo: null, bar: 0 }
