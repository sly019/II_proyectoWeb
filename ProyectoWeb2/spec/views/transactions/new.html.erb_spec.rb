require 'rails_helper'

RSpec.describe "transactions/new", type: :view do
  before(:each) do
    assign(:transaction, Transaction.new(
      :product_req_id => "",
      :product_offered_id => ""
    ))
  end

  it "renders new transaction form" do
    render

    assert_select "form[action=?][method=?]", transactions_path, "post" do

      assert_select "input#transaction_product_req_id[name=?]", "transaction[product_req_id]"

      assert_select "input#transaction_product_offered_id[name=?]", "transaction[product_offered_id]"
    end
  end
end
