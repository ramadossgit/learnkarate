@ignore
Feature: Get API feature

Scenario: get user details
    Given url baseUrl+'/public/v1/users/6793086'
    When method GET
    Then status 200
    * print response
    * def jsonResponse = response
    * print jsonResponse
    * def actName = jsonResponse.data.name
    * print actName
    * match actName == 'Pushti Kapoor II'


Scenario: get user details not found
    Given url baseUrl+'/public/v1/users/1'
    When method GET
    Then status 404
    * print response
    * def jsonResponse = response
    * print jsonResponse
