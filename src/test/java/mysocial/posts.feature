Feature: Verify posts api for mysocial

Background: Initialize stuff

Scenario: Verify /posts works
    Given url 'https://jsonplaceholder.typicode.com/posts'
    When method get
    Then status 200
    And assert response.length == 100
    And assert responseTime <1000
    * print responseCookies
    And match responseHeaders['Content-Type'][0] == 'application/json; charset=utf-8'
