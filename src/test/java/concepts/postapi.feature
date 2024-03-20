@ignore
Feature:Create User using post api

Background: 
    * url baseUrl
    * def requestPayload = 
    """
    {
        "name":"tom",
        "email": "tom2022@gmail.com",
        "gender":"male",
        "status":"active"
    }
    
    """
Scenario: Create a user with the given data
    Given path '/public/v1/users'
    And request requestPayload
    And header Authorization = 'Bearer ' + '171627ce11c41f1b1947a0428824704b3e8705ce09173f1ff3ac2a3f3b6f10c9'
    When method post 
    Then status 201
    And match $.data.id == '#present'
    And match $.data.name == '#present'
    And match $.data.name == 'tom'
    And match  $.data.email == 'tom2022@gmail.com'
