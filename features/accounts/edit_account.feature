@edit_account
Feature: Edit a new account
	As a User
	I would like to be able to edit an account

	Background:
		Given I am a new, authenticated user
		And I have the following account record
			| name | balance | user_id | 
			| Bank | 0       | 1       |
		And I am on the edit "Bank" account page

	Scenario Outline: Successful edit
		When I fill in Name with "<name>"
		And I fill in Balance with "<balance>"
		And I press "Update Account"
		Then I should see "Account was successfully updated"
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
		And I press "Update Account"
		Then I should see validation error

		Examples:
			| name                                                 | balance | 
			|                                                      | 0       | 
			| aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa | 0       | 
			| x                                                    |         | 
			| x                                                    | x       | 
			| x                                                    | <15>    | 
