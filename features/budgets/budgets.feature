Feature: Budgets management
	In order to better manage his money
	The User
	Should be able to edit his budgets

	Background:
		Given I am a new, authenticated user
		And I have the following account records
			| id | name | balance | user_id | 
			| 1  | Cash | 2500    | 1       | 
			| 2  | Bank | 15000   | 1       | 
		And I have the following category records
			| id | name        | balance | user_id | 
			| 1  | Electricity | 100     | 1       | 
			| 2  | Groceries   | 500     | 1       | 
		And I have the following budget records
			| id | category_id | value | 
			| 1  | 1           | 100   | 
			| 2  | 2           | 450   | 
		And I have the following transaction records
			| value | entity           | expense | category_id | account_id | 
			| 95    | Electricity bill | true    | 1           | 2          | 
			| 150   | Groceries        | true    | 1           | 1          | 
			| 50    | Groceries        | true    | 1           | 1          | 

	Scenario: View budgets
		When I navigate to the view budgets page
		Then I should see a table with a row for each category and the budget, spending and remainings for each month on the columns
