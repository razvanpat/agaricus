Feature: Category management
	In order to better manage his budget
	The user
	Should be able to edit the list of categories he can asign a budget to


Scenario: Category list editing
	Given I have categories
	Then I should be able to create a new category
	And I should be able to edit an existing category
	And I should be able to delete category
