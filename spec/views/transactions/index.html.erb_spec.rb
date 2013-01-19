require 'spec_helper'

describe "transactions/index" do
  before(:each) do
    assign(:transactions, [
      stub_model(Transaction,
        :account_id => 1,
        :category_id => 2,
        :entity => "Entity",
        :expense => false,
        :value => "9.99"
      ),
      stub_model(Transaction,
        :account_id => 1,
        :category_id => 2,
        :entity => "Entity",
        :expense => false,
        :value => "9.99"
      )
    ])
  end

  it "renders a list of transactions" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Entity".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
