Given /^I am viewing the category list$/ do
  visit categories_path
end

Given /^I have the Gas category$/ do
  @gas_category = Category.create!(name: 'Gas', balance: '100')
end

When /^I press the add transaction link next to the category$/ do
  within("#category-#{@gas_category.id}") do
    click_link "Add Transaction"
  end
end

Then /^I should be taken to the add transaction page$/ do
  current_url == new_transaction_path
end

Then /^I should have the Gas category preselected$/ do
  page.find("#transaction_category_id option[selected]").text.should == "Gas"
end

When /^I click new transaction from the menu$/ do
  visit root_path
  click_link('Add Transaction')
end

Then /^I should see "(.*?)" in the account select box$/ do |arg1|
  page.should have_no_selector("#transaction_account_id options[selected]")
  page.find(:xpath, "//*[@id='transaction_account_id']/option[1]").text.should == arg1
end

Then /^I should see "(.*?)" in the category select box$/ do |arg1|
  page.should have_no_selector("#transaction_category_id option[select]")
  page.find(:xpath, "//*[@id='transaction_category_id']/option[1]").text.should == arg1
end

Then /^I should( not)? see transaction "(.*?)"$/ do |negate, arg1|
  if negate
    page.should_not have_content(arg1)
  else
    page.should have_content(arg1)
  end
end

When /^I create an (expense|income) transaction for account "(.*?)" and category "(.*?)" with value "(.*?)"$/ do |type, account, category, value|
  @account = Account.find_by_name(account)
  @category = Category. find_by_name(category)
  if type == "expense"
    FactoryGirl.create(:transaction, {account_id: @account.id, category_id: @category.id, value: value, expense: true}) 
  else
    FactoryGirl.create(:transaction, {account_id: @account.id, category_id: @category.id, value: value, expense: false}) 
  end
end

