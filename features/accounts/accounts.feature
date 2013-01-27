@accounts
Feature: Account management
	In order to better manage his money
	The user
	Should be able to see and edit his accounts to his liking

	Background:
		Given I am a new, authenticated user
		And I have the following account records
			| id | user_id | name   | balance | 
			| 1  | 1       | Cash   | 2500    | 
			| 2  | 1       | Bank   | 15000   | 

	Scenario: Access acounts list
		Given I am on the homepage
		When I click the accounts link
		Then I should see "Cash"
		And I should see "Bank"
		And a new account link
		And edit account link
		And delete account link

	Scenario: Delete an account
		Given I am on the accounts list page
		When I click the delete link for "Bank"
		And I go back to accounts list page
		Then I should not see "Bank"
