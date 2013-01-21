require 'spec_helper'

describe "budgets/show" do
  before(:each) do
    @budget = assign(:budget, stub_model(Budget,
      :category_id => 1,
      :month => 2,
      :year => 3,
      :value => "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/3/)
    rendered.should match(/9.99/)
  end
end
