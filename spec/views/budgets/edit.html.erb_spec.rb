require 'spec_helper'

describe "budgets/edit" do
  before(:each) do
    @budget = assign(:budget, stub_model(Budget,
      :category_id => 1,
      :month => 1,
      :year => 1,
      :value => "9.99"
    ))
  end

  it "renders the edit budget form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => budgets_path(@budget), :method => "post" do
      assert_select "input#budget_category_id", :name => "budget[category_id]"
      assert_select "input#budget_month", :name => "budget[month]"
      assert_select "input#budget_year", :name => "budget[year]"
      assert_select "input#budget_value", :name => "budget[value]"
    end
  end
end
