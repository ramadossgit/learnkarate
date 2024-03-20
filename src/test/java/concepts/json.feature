@ignore
Feature: json feature testing

Scenario: json reader parser
    * def jsonObject = 
    """
    [
        {
            "name": "Tom",
            "City": "Chennai",
            "Age": 30
        },
        {
            "name": "Ram",
            "City": "Morrisville",
            "Age": 40
        }
    ]
    """
    * print jsonObject
    * print jsonObject[0]
    * print jsonObject[1].name +" "+ jsonObject[1].City + " " + jsonObject[1].Age



Scenario: parse complex json
    * def jsonObject = 
    """
    {"menu": {
  "id": "file",
  "value": "File",
  "popup": {
    "menuitem": [
      {"value": "New", "onclick": "CreateNewDoc()"},
      {"value": "Open", "onclick": "OpenDoc()"},
      {"value": "Close", "onclick": "CloseDoc()"}
    ]
  }
}}
    
  """
  * print jsonObject
  * print jsonObject.menu.popup.menuitem[0].value
