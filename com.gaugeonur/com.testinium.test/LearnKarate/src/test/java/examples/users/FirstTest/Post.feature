Feature: Post API DEMO
Background:
  * url 'https://reqres.in/'
  * header Accept = 'application/json'
  * def expectedOutput = read("response1.json")
  * def expectedOutput2 = read("response2.json")

  #Simple Post Example
  Scenario: Post Demo 1
    Given url 'https://reqres.in/api/users'
    And request {"name": "test", "job":"QA"}
    When method POST
    Then status 201
    And print response

  #Simple Post Example with Background
  Scenario: Post Demo 2
    Given path 'api/users'
    And request {"name": "test", "job":"QA"}
    When method POST
    Then status 201
    And print response

  #Simple Post Example with Background
  Scenario: Post Demo 3
    Given path 'api/users'
    And request {"name": "test", "job":"QA"}
    When method POST
    Then status 201
    And match response == {"name": "test","job": "QA","id": "#string","createdAt": "#ignore"}
    And print response

  #Simple Post Example with Background
  Scenario: Post Demo 4
    Given path 'api/users'
    And request {"name": "test", "job":"QA"}
    When method POST
    Then status 201
    And match response == expectedOutput
    And match $ == expectedOutput
    And print response

     #Simple Post Example with Background
  Scenario: Post Demo 5
    Given path 'api/users'
    And def projectPath = karate.properties['user.dir']
    And print projectPath
    And def filePath = projectPath+'src/test/java/data/request.json'
    And print filePath
    And def requestBody1 = filePath
    And request requestBody1

    #And def requestBody = read("request.json")
    #And request requestBody
    When method POST
    Then status 201
    And match response == expectedOutput2
    And match $ == expectedOutput2
    And print response

  #Simple Post Example with Background
  Scenario: Post Demo 6
    Given path 'api/users'
    And def reqBody = read("request.json")
    And set reqBody.job = 'Engineer'
    When method POST
    Then status 201
    #And match response == {"name":"test", "job":"Engineer", "id":"#string", "createdAt":"#ignore"}
    And print response


