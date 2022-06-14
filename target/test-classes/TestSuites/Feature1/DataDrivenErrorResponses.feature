Feature: Check  error codes for created users 400 .. 
#Finde more examples in https://github.com/karatelabs/karate#data-driven-tests

Background: 
    Given def dataGenerator = Java.type('inheritanceFeatures.dataGenerator')
    Given url apiUrl
      * def randomEmail = dataGenerator.getRandomEmail()
      * def randomUsername = dataGenerator.getRandomUsername()

Scenario Outline: Validate diferents 400 errors as false negatives escenarios
    Given path 'users'
    And request 
    """
        {
            "user": {
            
              "email": <email>,
              "password": <password>,
              "username": <username>
            }
          }
    """
    When method Post
    Then status 422
    #Column tag of table data 
    And match response == <errorResponse>

    #We can validate a flow with differents scenarios of data driven

    Examples:
        | email               | password |username          |errorResponse                                                                         |
        | #(randomEmail)      | karate1  |karateuser        |{"errors":{"username":["has already been taken"]}}                                    |
        | karatetest@mail.com | karate1  |#(randomUsername) |{"errors":{"email":["has already been taken"]}}                                       |
        | karatetest@mail.com | karate1  |karate1           |{"errors":{"email":["has already been taken"],"username":["has already been taken"]}} |
        |                     | karate1  |#(randomUsername) |{"errors":{"email":["can't be blank"]}}                                               |

