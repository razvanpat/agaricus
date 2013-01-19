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

