@add_transaction
Feature: Add transaction
	In order to keep track of how much of a budget has been spent and earned
	The User
	Should be able to create a transaction

	Background:
		Given I am a new, authenticated user
		And I have the following account records
			| id | name | balance | user_id | 
			| 1  | Cash | 2500    | 1       | 
			| 2  | Bank | 15000   | 1       | 
		And I have the following category records
			| id | name    | balance | user_id | 
			| 1  | Generic | 100     | 1       | 
			| 2  | Empty   | 500     | 1       | 
		And I have the following transaction records
			| value | entity | expense | category_id | account_id | 
			| 150   | foo    | true    | 1           | 1          | 
			| 150   | bar    | false   | 1           | 1          | 



	Scenario: Add transaction from category list
		Given I am viewing the category list
		When I press the add transaction link next to the "Generic" category
		Then I should be taken to the add transaction page
		And I should see "Generic" in the category select box


	Scenario: Add transaction from account list
		Given I am viewing the account list
		When I press the add transaction link next to account "Bank"
		Then I should be taken to the add transaction page
		And I should see "Bank" in the account select box


	Scenario: Add transaction account default value
		When I click new transaction from the menu
		Then I should see "- Please select -" in the account select box


	Scenario: Add transaction category default value
		When I click new transaction from the menu
		Then I should see "- Please select -" in the category select box


	Scenario Outline: Adding a transaction changes the balance of it's coresponding account
		Given I am on the add transaction page
		When I select category "<category>"
		And I select account "<account>"
		And I set expense to "<expense>"
		And I fill in Value with "<value>"
		And I press "Create Transaction"
		Then the balance of the "<account>" account should be "<expected_value>"

		Examples:
			| account | category | expense | value | expected_value | 
			| Cash    | Generic  | true    | 50.25 | 2449.75        | 
			| Bank    | Generic  | false   | 25    | 15025          | 
