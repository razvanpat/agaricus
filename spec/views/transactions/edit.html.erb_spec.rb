require 'spec_helper'

describe "transactions/edit" do
  before(:each) do
    @transaction = assign(:transaction, stub_model(Transaction,
      :account_id => 1,
      :category_id => 1,
      :entity => "MyString",
      :expense => false,
      :value => "9.99"
    ))
  end

  it "renders the edit transaction form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => transactions_path(@transaction), :method => "post" do
      assert_select "input#transaction_account_id", :name => "transaction[account_id]"
      assert_select "input#transaction_category_id", :name => "transaction[category_id]"
      assert_select "input#transaction_entity", :name => "transaction[entity]"
      assert_select "input#transaction_expense", :name => "transaction[expense]"
      assert_select "input#transaction_value", :name => "transaction[value]"
    end
  end
end
