Feature:
  Background:
    * def data = read('data.xml')

  Scenario: read xml file and print data
    * print data
    * print 'Data type of :: ', typeof data

  Scenario: select all the nodes with the nodename
    * def res = $data/bookstore/book[1]
    * print res
    * def matcher =
    """
     <book category="cooking">
      <title lang="en">Everyday Italian</title>
      <author>Giada De Laurentiis</author>
      <year>2005</year>
      <price>30.00</price>
      </book>
    """
    * match data/bookstore/book[1] == matcher

  Scenario: // use in xml
    * def res = $data //title[@lang]
    * print res

    * def books = $data //book
    * print books

    * def titles = $data //title.
    * print titles


  Scenario: when xpath exressions return xml chunks (or node lists)

    * def response =
    """
    <teachers>
        <teacher department="science" id="309">
            <subject>math</subject>
            <subject>physics</subject>
        </teacher>
        <teacher department="arts" id="310">
            <subject>political education</subject>
            <subject>english</subject>
        </teacher>
    </teachers>
    """
    * def expected = <teacher department="science" id="309"><subject>math</subject><subject>physics</subject></teacher>
    * def teacher = //teacher[@department='science']
    * def subjects = //teacher[@department='science']/subject
    * print 'teacher ', teacher
    * match teacher == expected
    * print 'teacher ', subjects
    * def getTeacher = get response //teacher[@department='science']
    * print 'getTeacher :: ', getTeacher

    * def not_expected = ['physics', 'math']
    * def expected = ['math', 'physics']
    * def subjects = //teacher[@department='science']/subject
    * match subjects == expected
    * match subjects != not_expected

  Scenario: @ The current node being processed by a filter predicate.
    * def response = data

    * def title = //title[@*]
    * print '@title ', title

    * def years = //year
    * def match_year = ["2005", "2005", "2003", "2003"]
    * print 'All years ', years
    * match years == match_year

    * def con_years = $..book[0]
    * print con_years












