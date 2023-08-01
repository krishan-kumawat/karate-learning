Feature:


Scenario:
  Given def clientid = "3MVG9n_HvETGhr3DUkrS5_wQ3j75I0kotrKyk_AtTmPWsLYkn4iVzpUsVqZmLyqfNzUz2zdcLodGv1aquGPSU"
  And def clientsecret = "9402D93C6035FF3FC23A55B7F057F8E3BE0160B289A1432F9FF9C491D2749A1C"
  And def username = "akash.sharma@resourceful-koala-tl33au.com"
  And def password = "salesforce@1230M86OnDlOciJWvJomqq3t48i"

  Given url "https://login.salesforce.com/services/oauth2/token"
  And form field grant_type = 'password'
  And form field client_id = clientid
  And form field client_secret = clientsecret
  And form field username = username
  And form field password = password

  Then method  post
  Then status 200

  * print 'response ',response
  * print 'this is response ',response.access_token