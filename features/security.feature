@security
Feature: Ensure application is secure
	As a User I want to make sure nobody but myself can access my private data

	Background:
		Given I have the following user records
			| id | email        | password | 
			| 1  | bob@mail.com | 12345678 | 
			| 2  | jim@mail.com | asdfghjk | 
		And I have the following account records
			| id | user_id | name   | balance | 
			| 1  | 1       | Cash   | 2500    | 
			| 2  | 1       | Bank   | 15000   | 
			| 3  | 2       | Wallet | 500     | 
			| 4  | 2       | Card   | 600     | 
		And I have the following category records
			| id | user_id | name        | balance | 
			| 1  | 1       | Generic     | 100     | 
			| 2  | 1       | Empty       | 500     | 
			| 3  | 2       | Video Games | 400     | 
			| 4  | 2       | Computer    | 500     | 
		And I have the following transaction records
			| id | value | entity     | expense | category_id | account_id | 
			| 1  | 150   | foo        | true    | 1           | 1          | 
			| 2  | 150   | bar        | false   | 1           | 1          | 
			| 3  | 130   | Razr mouse | true    | 4           | 3          | 
		And I have the following budget records
			| id | category_id | value | 
			| 1  | 1           | 100   | 
			| 2  | 4           | 500   | 
		And I am logged in as "bob@mail.com" with password "12345678"


	Scenario: 
		When I visit accounts path
		Then I should see account "Cash"
		And I should not see account "Wallet"
	
	Scenario:
		When I visit categories path
		Then I should see "Generic"
		And I should not see "Computer"
