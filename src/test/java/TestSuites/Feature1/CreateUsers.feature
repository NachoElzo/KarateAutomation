Feature: Create New Users
    Background:
    Given def dataGenerator = Java.type('inheritanceFeatures.dataGenerator')
    Given url apiUrl
      #Variables to call the functions to create data randomly
      * def randomEmail = dataGenerator.getRandomEmail()
      * def randomUsername = dataGenerator.getRandomUsername()
      * print ("THE DATA GENERATED IS: EMAIL " + randomEmail + "USERNAME " +  randomUsername)

    Scenario: New User Sing Up
     Given path 'users'
     And request 
        #Call the variables to generate ramdom data
        """
            {
                "user": {
                
                  "email": #(randomEmail),
                  "password": "staticPasword",
                  "username": #(randomUsername)
                }
              }
        """
        When method Post
        Then status 200
        #Comparing that the returned values are the type of values defined
        And match response ==
        """
          {
            "user": {
                "email": #(randomEmail),,
                "username": #(randomUsername),
                "bio": null,
                "image": null,
                "token": '#string'
            }
        }

        """

