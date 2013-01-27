@add_account
Feature: Add a new account
	As a User
	I would like to be able to create a new account

	Background:
		Given I am on the add account page
		And I am a new, authenticated user

	Scenario Outline: Successful creation
		When I fill in Name with "<name>"
		And I fill in Balance with "<balance>"
		And I press "Create Account"
		Then I should see "Account was successfully created"
		And I should see "<name>"

		Examples:
			| name                           | balance    | 
			| 1                              | 0          | 
			| Swiss Bank                     | 10000000   | 
			| Economy+                       | 500        | 
			| Borrowed from a lot of firends | -5000.5555 | 
			| <("xy")-['ab']@#{?-_=.,\/!}>   | 1          | 

	Scenario Outline: Validation error
		When I fill in Name with "<name>"
		And I fill in Balance with "<balance>"
		And I press "Create Account"
		Then I should see validation error

		Examples:
			| name                                                 | balance | 
			|                                                      | 0       | 
			| aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa | 0       | 
			| x                                                    |         | 
			| x                                                    | x       | 
			| x                                                    | <15>    | 
