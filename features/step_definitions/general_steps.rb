Given /^I have the following (.+) records?$/ do |factory, table|
  # table is a Cucumber::Ast::Table
  table.hashes.each do |hash|
    FactoryGirl.create(factory, hash)
  end
end

Given /^I am a new, authenticated user$/ do
  email = 'testing@man.net'
  password = 'secretpass'
  User.new(:email => email, :password => password, :password_confirmation => password).save!

  visit '/users/sign_in'
  fill_in "user_email", :with => email
  fill_in "user_password", :with => password
  click_button "Sign in"
end

Then /^I should( not)? see "(.*?)"$/ do |arg1, arg2|
  if arg1
    page.should_not have_content(arg2)
  else
    page.should have_content(arg2)
  end
end

