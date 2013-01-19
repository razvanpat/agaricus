require 'spec_helper'

describe "transactions/show" do
  before(:each) do
    @transaction = assign(:transaction, stub_model(Transaction,
      :account_id => 1,
      :category_id => 2,
      :entity => "Entity",
      :expense => false,
      :value => "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/Entity/)
    rendered.should match(/false/)
    rendered.should match(/9.99/)
  end
end
