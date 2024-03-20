@ignore
Feature: Get API hearders feature

Scenario: pass the user request with headers
    Given header "Content-Type" = 'Application/json'
    And url baseUrl+'/public/v1/users/6793086'
    When method GET
    Then status 200
    * print response
    * def jsonResponse = response
    * print jsonResponse