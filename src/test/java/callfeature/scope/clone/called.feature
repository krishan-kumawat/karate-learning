Feature:

  Scenario:
    * match foo == { key: 'value' }
    * foo.key = 'changed'
    * match foo == { key: 'changed' }