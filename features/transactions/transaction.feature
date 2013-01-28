@transactions
Feature: Transaction management
	In order to keep track of how much of a budget has been spent and earned
	The User
	Should be able to edit his transaction list

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
