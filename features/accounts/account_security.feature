@account_security
Feature: Account security
	In order to have privacy
	As a user
	I cannot see or modify an account that is not mine

	Background:
		Given I have the following user records
			| id | email            | password | 
			| 1  | l33t@hackers.org | 1h@cku   | 
			| 2  | bob@home.com     | 123456 |
		And I have the following account record
			| id | name | balance | user_id | 
			| 1  | Bank | 5700    | 2       | 


		@allow-rescue
	Scenario Outline: Bobs data gets accessed by various users
		Given I am logged in as "<username>" with password "<password>"
		When I submit a <request_type> request for <model> "<entry_name>"
		Then I should see <see> 

		Examples:
			 | username         | password | request_type | model   | entry_name | see          | 
			 |                  |          | GET          | account | Bank       | "redirected" | 
			 |                  |          | PUT          | account | Bank       | "redirected" | 
			 |                  |          | POST         | account | Bank       | "redirected" | 
			 |                  |          | DELETE       | account | Bank       | "redirected" | 
			 | l33t@hackers.org | 1h@cku   | GET          | account | Bank       | 404 page     | 
			 | l33t@hackers.org | 1h@cku   | PUT          | account | Bank       | 404 page     | 
			 | l33t@hackers.org | 1h@cku   | DELETE       | account | Bank       | 404 page     | 

