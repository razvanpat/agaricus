@focus
Feature: Transaction management
	In order to keep track of how much of a budget has been spent and earned
	The User
	Should be able to edit his transaction list

	Background:
		Given I am a new, authenticated user
		And I have the following account records
		   | id | name | balance | 
		   | 1  | Cash | 2500    | 
		   | 2  | Bank | 15000   | 
		And I have the following category records
			 | id | name    | balance | 
			 | 1  | Generic | 100     | 
			 | 2  | Empty   | 500     | 
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


	Scenario: View transaction list in the account and category displays
		When I navigate to account "Cash"
		Then I should see transaction "foo"
		And I should see transaction "bar"
		When I navigate to account "Bank"
		Then I should not see transaction "foo"
		When I navigate to category "Generic"
		Then I should see transaction "foo"
		And I should see transaction "bar"
		When I navigate to category "Empty"

	Scenario: Adding a transaction changes the balance of it's coresponding account
		When I create an expense transaction for account "Cash" and category "Generic" with value "50.25"
		Then the balance of the "Cash" account should be "2449.75"
		When I create an income transaction for account "Bank" and category "Generic" with value "25"
		Then the balance of the "Bank" account should be "15025"

