@budgets
Feature: Budgets management
	In order to better manage his money
	The User
	Should be able to edit his budgets

	Background:
		Given I am a new, authenticated user
		And I have the following account record
			| id | name | balance | user_id | 
			| 1  | Bank | 17500   | 1       | 
		And I have the following category records
			| id | name        | balance | user_id | 
			| 1  | Electricity | 100     | 1       | 
			| 2  | Groceries   | 500     | 1       | 
			| 3  | Car         | 0       | 1       |
		And I have the following budget records
			| id | category_id | value | 
			| 1  | 1           | 400   | 
			| 2  | 2           | 450   | 
		And I have the following transaction records
			| value | entity            | expense | category_id | account_id | 
			| 100   | Electricity bill  | true    | 1           | 1          | 
			| 10    | Some return money | false   | 1           | 1          | 
			| 150   | Groceries         | true    | 1           | 1          | 
			| 50    | Groceries         | true    | 1           | 1          | 

	Scenario: View budgets
		When I navigate to the view budgets page
		Then I should see a table with a row for each category and the budget, spending and remainings for each month on the columns

	Scenario: View unbudgeted ammount
		When I navigate to the view budgets page
		Then I should see "You have 16660.0 not budgeted"

	Scenario: Unbudgeted message when all money is budgeted
		Given I have the following budget record
			| id | category_id | value | 
			| 3  | 3           | 16660 | 
		When I navigate to the view budgets page
		Then I should see "All money is budgeted. Well done."

	Scenario: Unbudgeted message when budgets exceed available money 
		Given I have the following budget record
			| id | category_id | value | 
			| 3  | 3           | 16760 | 
		When I navigate to the view budgets page
		Then I should see "You need 100.0 more to cover your budgets."
