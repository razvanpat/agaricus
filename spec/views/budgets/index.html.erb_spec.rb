require 'spec_helper'

describe "budgets/index" do
  before(:each) do
    assign(:budgets, [
      stub_model(Budget,
        :category_id => 1,
        :month => 2,
        :year => 3,
        :value => "9.99"
      ),
      stub_model(Budget,
        :category_id => 1,
        :month => 2,
        :year => 3,
        :value => "9.99"
      )
    ])
  end

  it "renders a list of budgets" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
