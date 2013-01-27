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

Given /^I am on the add account page$/ do
  visit new_account_path
end

When /^I fill in Name with "(.*?)"$/ do |arg1|
  fill_in "Name", with: arg1
end

When /^I fill in Balance with "(.*?)"$/ do |arg1|
  fill_in "Balance", with: arg1
end

When /^I press "(.*?)"$/ do |arg1|
  click_button arg1
end

Then /^I should see validation error$/ do
   page.should have_selector(".field_with_errors")
end

Given /^I am on the edit "(.*?)" account page$/ do |arg1|
  account = Account.find_by_name(arg1)
  visit edit_account_path account 
end

Given /^I am on the accounts list page$/ do
  visit accounts_path
end

When /^I click the delete link for "(.*?)"$/ do |arg1|
  account = Account.find_by_name arg1
  within "#account-#{account.id}" do
    click_link "Delete"
  end
end

When /^I go back to accounts list page$/ do
end

