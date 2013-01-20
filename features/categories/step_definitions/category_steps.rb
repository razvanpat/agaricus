Given /^I have categories$/ do
	defined?(Category).should be_true
end

Then /^I should be able to create a new category$/ do
	category_name = 'New Category'
	visit new_category_path
	fill_in 'Name', with: category_name
	fill_in 'Balance', with: '100.50'
	click_button 'Create Category'
	page.should have_content 'successfully created'
	visit categories_path
	page.should have_content category_name
end

Then /^I should be able to edit an existing category$/ do
	@edited_category_name = 'Edited Category'
	@category = Category.find(:first)
	visit edit_category_path(@category)
	fill_in 'Name', with: @edited_category_name
	click_button 'Update Category'
	page.should have_content 'successfully updated'
	visit categories_path
	page.should have_content @edited_category_name
end

Then /^I should be able to delete category$/ do
	delete category_path(@category)
	visit categories_path
	page.should_not have_content @edited_category_name
end

When /^I navigate to category "(.*?)"$/ do |arg1|
  @category = Category.find_by_name(arg1)
  visit category_path(@category)
end

