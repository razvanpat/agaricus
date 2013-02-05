Given /^I am logged in as "(.*?)" with password "(.*)"$/ do |arg1, arg2|
  unless arg1.empty? 
    User.where("email = ?", arg1).all.size.should == 1
    visit '/users/sign_in'
    fill_in "user_email", :with => arg1
    fill_in "user_password", :with => arg2
    click_button "Sign in"
  end
end

When /^I visit accounts path$/ do
  visit accounts_path
end

Then /^I should see account "(.*?)"$/ do |arg1|
  page.should have_content(arg1)
end

Then /^I should not see account "(.*?)"$/ do |arg1|
  page.should_not have_content(arg1)
end

When /^I visit categories path$/ do
  visit categories_path
end

Given /^that I am not logged in$/ do
end
