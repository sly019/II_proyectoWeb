require 'rails_helper'

RSpec.describe "transactions/index", type: :view do
  before(:each) do
    assign(:transactions, [
      Transaction.create!(
        :product_req_id => "",
        :product_offered_id => ""
      ),
      Transaction.create!(
        :product_req_id => "",
        :product_offered_id => ""
      )
    ])
  end

  it "renders a list of transactions" do
    render
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
