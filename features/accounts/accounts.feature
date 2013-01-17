Feature: Account management
	In order to better manage his money
	The user
	Should be able to edit his accounts to his liking


Scenario: Account list editing
	Given I have accounts
	Then I should be able to create a new one
	And I should be able to edit an existing one
	And I should be able to delete one


Scenario: Access acounts list
	Given I am on the homepage
	When I click the accounts link
	Then I should see the account list
	And a new account link
	And edit account link
	And delete account link