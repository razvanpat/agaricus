require 'spec_helper'

describe "budgets/new" do
  before(:each) do
    assign(:budget, stub_model(Budget,
      :category_id => 1,
      :month => 1,
      :year => 1,
      :value => "9.99"
    ).as_new_record)
  end

  it "renders new budget form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => budgets_path, :method => "post" do
      assert_select "input#budget_category_id", :name => "budget[category_id]"
      assert_select "input#budget_month", :name => "budget[month]"
      assert_select "input#budget_year", :name => "budget[year]"
      assert_select "input#budget_value", :name => "budget[value]"
    end
  end
end
