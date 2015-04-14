require 'rails_helper'

RSpec.describe "products/index", type: :view do
  before(:each) do
    assign(:products, [
      Product.create!(
        :nombre => "Nombre",
        :descripcion => "Descripcion",
        :estado => "Estado"
      ),
      Product.create!(
        :nombre => "Nombre",
        :descripcion => "Descripcion",
        :estado => "Estado"
      )
    ])
  end

  it "renders a list of products" do
    render
    assert_select "tr>td", :text => "Nombre".to_s, :count => 2
    assert_select "tr>td", :text => "Descripcion".to_s, :count => 2
    assert_select "tr>td", :text => "Estado".to_s, :count => 2
  end
end
