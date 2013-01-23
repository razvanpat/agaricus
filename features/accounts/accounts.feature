Feature: Account management
	In order to better manage his money
	The user
	Should be able to edit his accounts to his liking


Scenario: Account list editing
	Given I am a new, authenticated user
	And I have accounts
	Then I should be able to create a new account
	And I should be able to edit an existing account
	And I should be able to delete account


Scenario: Access acounts list
	Given I am a new, authenticated user
	And I have the following account records
			| id | user_id | name   | balance | 
			| 1  | 1       | Cash   | 2500    | 
			| 2  | 1       | Bank   | 15000   | 
	And I am on the homepage
	When I click the accounts link
	Then I should see "Cash"
	And I should see "Bank"
	And a new account link
	And edit account link
	And delete account link
