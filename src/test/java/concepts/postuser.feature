@ignore
Feature: Read the request from json file
Background: 
    * url baseUrl
    * def requestPayload = read('classpath:resources/user.json')

    * def random_string = 
    """
    function(s){
        var text = "";
        var pattern = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstyz";
        for(var i=0; i<s; i++)
            text += pattern.charAt(Math.floor(Math.random() * pattern.length()));
            return text;
    }
    
    """
    * def randomString = random_string(10)
    * print randomString
    
    * set requestPayload.email = randomString + "@gmail.com"


Scenario: Create a user with the given data
    Given path '/public/v1/users'
    And request requestPayload
    And header Authorization = 'Bearer ' + '171627ce11c41f1b1947a0428824704b3e8705ce09173f1ff3ac2a3f3b6f10c9'
    When method post 
    Then status 201
    And match $.data.id == '#present'
    And match $.data.name == '#present'
    And match $.data.name == 'ram'
    And match $.data.email == requestPayload.email
