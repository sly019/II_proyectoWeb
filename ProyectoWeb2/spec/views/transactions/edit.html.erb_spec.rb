require 'rails_helper'

RSpec.describe "transactions/edit", type: :view do
  before(:each) do
    @transaction = assign(:transaction, Transaction.create!(
      :product_req_id => "",
      :product_offered_id => ""
    ))
  end

  it "renders the edit transaction form" do
    render

    assert_select "form[action=?][method=?]", transaction_path(@transaction), "post" do

      assert_select "input#transaction_product_req_id[name=?]", "transaction[product_req_id]"

      assert_select "input#transaction_product_offered_id[name=?]", "transaction[product_offered_id]"
    end
  end
end
