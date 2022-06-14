Feature: Asserts on articles and tags
#UI URL https://angular.realworld.io/
Background:
    Given url apiUrl
Scenario:Get Articles and assert response values
    #variable to read timeValidator function called in the array assert
    * def timeValidator = read('classpath:inheritanceFeatures/timeValidator.js')
    Given path 'articles'
    Given params {limit: 10, offset:0}
    Given method Get
    Given status 200
    #Articles array with 3 elements
    And match response == {"articles": "#[3]", "articlesCount": 3}
    #Whit the next validation we can make sure that ours arrays have the correct values assigned and we refactored the previus asserst
    # doble ## means that allows string and null type of value in bio parameter response (in bio parameter)
    #We compare the the variable timeValidator that reads the function in the timeValidator.js file '#? timeValidator(_)'
    And match each response.articles ==

    """
        {
            "slug": '#string',
            "title": '#string',
            "description":'#string',
            "body": '#string',
            "tagList": '#array',
            "createdAt": '#? timeValidator(_)',
            "updatedAt": '#? timeValidator(_)',
            "favorited": '#boolean',
            "favoritesCount": '#number',
            "author": {
                "username":'#string', 
                "bio": '##string', 
                "image": '#string',
                "following": '#boolean'
            }
        }

    """

