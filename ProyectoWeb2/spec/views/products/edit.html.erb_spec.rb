require 'rails_helper'

RSpec.describe "products/edit", type: :view do
  before(:each) do
    @product = assign(:product, Product.create!(
      :nombre => "MyString",
      :descripcion => "MyString",
      :estado => "MyString"
    ))
  end

  it "renders the edit product form" do
    render

    assert_select "form[action=?][method=?]", product_path(@product), "post" do

      assert_select "input#product_nombre[name=?]", "product[nombre]"

      assert_select "input#product_descripcion[name=?]", "product[descripcion]"

      assert_select "input#product_estado[name=?]", "product[estado]"
    end
  end
end
