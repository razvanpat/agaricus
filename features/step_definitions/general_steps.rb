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

When /^I fill in (.*?) with "(.*?)"$/ do |field, arg1|
  fill_in field, with: arg1
end

Given /^I clicked (.*?) from the menu$/ do |arg1|
  visit root_path
  within('nav') do 
    click_link(arg1)
  end
end

When /^I submit a (.*?) request for (.*?) "(.*?)"$/ do |request_type, model_name, item_name|
  model = model_name.capitalize.constantize()
  item = model.find_by_name(item_name)

  attributes = FactoryGirl.attributes_for(model_name)
  case request_type
  when "GET"
    page.driver.get(send(model_name + '_path', item))
  when "POST"
    page.driver.post(send(model_name.pluralize + '_path'), attributes)
  when "PUT"
    page.driver.put(send(model_name + '_path', item), attributes)
  when "DELETE"
    page.driver.delete(send(model_name + '_path', item))
  end

end
