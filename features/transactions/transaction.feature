Feature: Transaction management
	In order to keep track of how much of a budget has been spent and earned
	The User
	Should be able to edit his transaction list


	Scenario: Add transaction from category list
		Given I have the Gas category
		And I am viewing the category list
		When I press the add transaction link next to the category
		Then I should be taken to the add transaction page
		And I should have the Gas category preselected		


	@focus
	Scenario: Add transaction account default value
		Given I have the following account record
		   | id | name | balance | 
		   | 1  | Cash | 2500    | 
		When I click new transaction from the menu
		Then I should see "- Please select -" in the account select box

	
	Scenario: Add transaction category default value
		Given I have the following category record
			 | id | name    | balance | 
			 | 1  | Generic | 100     | 
		When I click new transaction from the menu
		Then I should see "- Please select -" in the category select box


	Scenario: View transaction list in the account and category displays
		Given I have the following account records
		   | id | name | balance | 
		   | 1  | Cash | 2500    | 
		   | 2  | Bank | 15000   | 
		And I have the following category records
			 | id | name    | balance | 
			 | 1  | Generic | 100     | 
			 | 2  | Empty   | 500     | 
		And I have the following transaction records
			 | value | entity | expense | category_id | account_id | 
			 | 100   | foo    | true    | 1           | 1          | 
			 | 150   | bar    | false   | 1           | 1          | 
		When I navigate to account "Cash"
		Then I should see transaction "foo"
		And I should see transaction "bar"
		When I navigate to account "Bank"
		Then I should not see transaction "foo"
		When I navigate to category "Generic"
		Then I should see transaction "foo"
		And I should see transaction "bar"
		When I navigate to category "Empty"
		Then I should not see transaction "foo"
