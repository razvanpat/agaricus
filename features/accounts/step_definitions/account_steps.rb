Given /^I have accounts$/ do
	defined?(Account).should be_true
end

Then /^I should be able to create a new one$/ do
	account_name = 'Account1'
	visit new_account_path
	fill_in 'Name', with: account_name
	fill_in 'Balance', with: '100.50'
	click_button 'Create Account'
	page.should have_content 'successfully created'
	visit accounts_path
	page.should have_content account_name
end

Then /^I should be able to edit an existing one$/ do
	@edited_account_name = 'Edited Account'
	@account = Account.find(:first)
	visit edit_account_path(@account)
	fill_in 'Name', with: @edited_account_name
	click_button 'Update Account'
	page.should have_content 'successfully updated'
	visit accounts_path
	page.should have_content @edited_account_name
end

Then /^I should be able to delete one$/ do
	delete account_path(@account)
	visit accounts_path
	page.should_not have_content  @edited_account_name
end


Given /^I am on the homepage$/ do
	visit root_path
	Account.create!(name: 'acc1', balance: 0)
	Account.create!(name: 'acc2', balance: 3)
end

When /^I click the accounts link$/ do
  click_link 'Accounts'
end

Then /^I should see the account list$/ do
  page.should have_content('acc1')
  page.should have_content('acc2')
end

Then /^a new account link$/ do
  page.should have_link('New Account')
end

Then /^edit account link$/ do
  page.should have_link('Edit')
end

Then /^delete account link$/ do
  page.should have_link('Delete')
end
