Feature: Create Token
    Scenario: Regular User token
        Given url apiUrl 
        Given path 'users/login'
        And request {"user": { "email": "#(userEmail)","password":"#(userPassword)"}}
        When method Post
        Then status 200
        #variable that store the login response token parameter
        * def authToken = response.user.token
