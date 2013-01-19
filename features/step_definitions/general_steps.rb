Given /^I have the following (.+) records?$/ do |factory, table|
  # table is a Cucumber::Ast::Table
  table.hashes.each do |hash|
    FactoryGirl.create(factory, hash)
  end
end
