require 'rails_helper'

RSpec.describe "products/new", type: :view do
  before(:each) do
    assign(:product, Product.new(
      :nombre => "MyString",
      :descripcion => "MyString",
      :estado => "MyString"
    ))
  end

  it "renders new product form" do
    render

    assert_select "form[action=?][method=?]", products_path, "post" do

      assert_select "input#product_nombre[name=?]", "product[nombre]"

      assert_select "input#product_descripcion[name=?]", "product[descripcion]"

      assert_select "input#product_estado[name=?]", "product[estado]"
    end
  end
end
