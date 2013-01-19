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
