Given /^I am viewing the category list$/ do
  visit categories_path
end

Given /^I have the Gas category$/ do
  @gas_category = Category.create!(name: 'Gas', balance: '100')
end

When /^I press the add transaction link next to the "(.*?)" category$/ do |arg1|
  category = Category.find_by_name(arg1)
  within("#category-#{category.id}") do
    click_link "Add Transaction"
  end
end

Then /^I should be taken to the add transaction page$/ do
  current_url.should include new_transaction_url
end

When /^I click new transaction from the menu$/ do
  visit root_path
  within('nav') do 
    click_link('Add Transaction')
  end
end

Then /^I should see "(.*?)" in the account select box$/ do |arg1|
  if page.has_selector?("#transaction_account_id option[selected]")
    page.find('#transaction_account_id option[selected]').text.should == arg1
  else
    page.find(:xpath, "//*[@id='transaction_account_id']/option[1]").text.should == arg1
  end
end

Then /^I should see "(.*?)" in the category select box$/ do |arg1|
  if page.has_selector?('#transaction_category_id option[selected]')
    page.find("#transaction_category_id option[selected]").text.should == arg1
  else
    page.find(:xpath, "//*[@id='transaction_category_id']/option[1]").text.should == arg1
  end
end

Then /^I should( not)? see transaction "(.*?)"$/ do |negate, arg1|
  if negate
    page.should_not have_content(arg1)
  else
    page.should have_content(arg1)
  end
end

When /^I press the add transaction link next to account "(.*?)"$/ do |arg1|
  account = Account.find_by_name(arg1)
  within("#account-#{account.id}") do
    click_link "Add Transaction"
  end
end

Given /^I am on the add transaction page$/ do
  visit new_transaction_path
end

When /^I select category "(.*?)"$/ do |arg1|
  unless arg1.empty?
    page.select(arg1, from: "transaction_category_id")
  end
end

When /^I select account "(.*?)"$/ do |arg1|
  unless arg1.empty?
    page.select(arg1, from: "transaction_account_id")
  end
end

When /^I set expense to "(.*?)"$/ do |arg1|
  if arg1 == 'true'
    page.check('transaction_expense')
  end
end

Then /^I should be taken to the category list page$/ do
  current_url.should eq categories_url
end

Then /^I should be taken to the account list page$/ do
  current_url.should eq accounts_url
end

