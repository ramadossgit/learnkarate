@ignore
Feature: print hello world feature

Scenario: Hello world print 
    * print 'Hello world'
    * print 'Hello Ramadoss'


Scenario: declare and pring variables
    * def balance = 200
    * def fee = 20
    * def tax = 10
    * print 'total amount ->' + (balance + fee + tax)
