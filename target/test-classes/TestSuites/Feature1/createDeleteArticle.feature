Feature: Create An article

Background: define URL
    Given url apiUrl
    #Variable that calls the extarnal json file that contains the body 
    * def articleRequestBody = read('classpath:externalFiles/ArticleData.json')
    # Variable for read java file that contains the dummy data generator for the body 
    * def dataGenerator = Java.type('inheritanceFeatures.dataGenerator')
    #to set values from differents funtions in the body from article request
    * set articleRequestBody.article.title = dataGenerator.getRandomArticlesValues().title
    * set articleRequestBody.article.description = dataGenerator.getRandomArticlesValues().description
    * set articleRequestBody.article.body = dataGenerator.getRandomArticlesValues().body

Scenario: Create and delete a new article

    #CREATING A NEW ARTICLE
    Given path 'articles'
    #We call the variable with the json file that contains the body
    And request articleRequestBody
    When method Post
    Then status 200
    * def SlugArticleId = response.article.slug
    And match response.article.title == articleRequestBody.article.title

  
    Given path 'articles', SlugArticleId
    When method Delete
    Then status 200

    Given params { limit: 10, offset: 0}
    Given path 'articles'
    When method Get
    Then status 200
    And match response.articles[0].title != articleRequestBody.article.title



    
    



