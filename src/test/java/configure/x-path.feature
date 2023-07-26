Feature: x-path
  Scenario: read x-path functions
    * def myXml =
      """
        <records>
          <record index="1">a</record>
          <record index="2">b</record>
          <record index="3" foo="bar">c</record>
        </records>
      """
    * match myXml count(/records//record) == 3
    * match myXml //record[@index='1'] == 'a'


    Scenario: advanced x-path
      * def teachers =
        """
        <teachers>
          <teacher department="science">
            <subject>math</subject>
            <subject>physics</subject>
          </teacher>
          <teacher department="arts">
            <subject>political education</subject>
            <subject>english</subject>
          </teacher>
        </teachers>
        """
      * match teachers //teacher[@department="science"]/subject == ['math', 'physics']

  Scenario: karate.xmlPath()
    * def xml = <query><name><foo>bar</foo></name></query>
    * def elementName = 'name'
    * def name = karate.xmlPath(xml, 'query/'+ elementName + '/foo')
    * match name == 'bar'

    * def queryName = karate.xmlPath(xml, '/query/' + elementName)
    * match queryName == <name><foo>bar</foo></name>


