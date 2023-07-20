Feature:
 Scenario:
     * def main =
     """
     function() {
       var Demo = Java.type('javafiles.Demo');
       var sdf = new Demo();
       return sdf.printText() // '.getTime()' would also have worked instead of '.time'
     }
     """
    * assert main() == 'Interopp'