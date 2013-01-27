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


	Scenario: not logged in hacker tries to see bobs bank account
		Given that I am not logged in
		When I navigate to account "Bank"
		Then I should see "Sign in"
	
	@allow-rescue
	Scenario: logged in hacker tries to see bobs bank account
		Given I am logged in as "l33t@hackers.org" with password "1h@cku"
		When I navigate to account "Bank"
		Then I should see 404 page
		
