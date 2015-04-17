require 'rails_helper'

RSpec.describe "usuarios/index", type: :view do
  before(:each) do
    assign(:usuarios, [
      Usuario.create!(
        :username => "Username",
        :password_hast => "Password Hast",
        :password_salt => "Password Salt",
        :token => "Token"
      ),
      Usuario.create!(
        :username => "Username",
        :password_hast => "Password Hast",
        :password_salt => "Password Salt",
        :token => "Token"
      )
    ])
  end

  it "renders a list of usuarios" do
    render
    assert_select "tr>td", :text => "Username".to_s, :count => 2
    assert_select "tr>td", :text => "Password Hast".to_s, :count => 2
    assert_select "tr>td", :text => "Password Salt".to_s, :count => 2
    assert_select "tr>td", :text => "Token".to_s, :count => 2
  end
end
