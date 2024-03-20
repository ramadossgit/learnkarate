Feature: Verify posts api for mysocial

Background: Initialize stuff
    Given url 'https://jsonplaceholder.typicode.com'
Scenario Outline: Verify /post/<postid> works
    Given path '/posts'
    And path <postid>
    When method get
    Then status 200
    And match response ==

    """
    {
    "userId": '#number',
    "id": <postid>,
    "title": '#string',
    "body": '#string',
    }    
    """
    Examples:
        |postid|
        |  1   |
        |  2   |
        |  3   |

    Scenario Outline: Verify that a new post can be created through data driven
        Given path 'posts'
        And header Content-Type = 'application/json; charset=UTF-8'
        And request
        """
        {title: <title>,
        body: <body>,
        userId: <userId>
        }    
        """
        When method post
        Then status 201
        And match response ==  {id: '#number', title: <title>,body: <body>,userId: <userId>}  

        Examples:
           |read('post_data.json')|