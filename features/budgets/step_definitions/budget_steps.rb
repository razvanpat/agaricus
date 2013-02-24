When /^I navigate to the view budgets page$/ do
  visit budgets_path
end

Then /^I should see a table with a row for each category and the budget, spending and remainings for each month on the columns$/ do
  page.find(:xpath, '/html/body/div/table/tr[3]/td[5]').should have_text('400')
  page.find(:xpath, '/html/body/div/table/tr[3]/td[6]').should have_text('300')
  page.find(:xpath, '/html/body/div/table/tr[3]/td[7]').should have_text('100')
end
