Given /^I have accounts$/ do
	defined?(Account).should be_true
end

Then /^I should be able to create a new account$/ do
	account_name = 'Account1'
	visit new_account_path
	fill_in 'Name', with: account_name
	fill_in 'Balance', with: '100.50'
	click_button 'Create Account'
	page.should have_content 'successfully created'
	visit accounts_path
	page.should have_content account_name
end

Then /^I should be able to edit an existing account$/ do
	@edited_account_name = 'Edited Account'
	@account = Account.find(:first)
	visit edit_account_path(@account)
	fill_in 'Name', with: @edited_account_name
	click_button 'Update Account'
	page.should have_content 'successfully updated'
	visit accounts_path
	page.should have_content @edited_account_name
end

Then /^I should be able to delete account$/ do
  within("#account-#{@account.id}") do
    expect { click_link 'Delete' }.to change(Account, :count).by(-1)
  end
end


Given /^I am on the homepage$/ do
	visit root_path
end

When /^I click the accounts link$/ do
  click_link 'Accounts'
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

When /^I navigate to account "(.*?)"$/ do |arg1|
  @account = Account.find_by_name(arg1)
  visit account_path(@account)
end

Then /^the balance of the "(.*?)" account should be "(.*?)"$/ do |arg1, arg2|
  @account = Account.find_by_name(arg1)
  @account.balance.should == arg2.to_f
end

Given /^I am viewing the account list$/ do
  visit accounts_path
end

