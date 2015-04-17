require 'rails_helper'

RSpec.describe "usuarios/new", type: :view do
  before(:each) do
    assign(:usuario, Usuario.new(
      :username => "MyString",
      :password_hast => "MyString",
      :password_salt => "MyString",
      :token => "MyString"
    ))
  end

  it "renders new usuario form" do
    render

    assert_select "form[action=?][method=?]", usuarios_path, "post" do

      assert_select "input#usuario_username[name=?]", "usuario[username]"

      assert_select "input#usuario_password_hast[name=?]", "usuario[password_hast]"

      assert_select "input#usuario_password_salt[name=?]", "usuario[password_salt]"

      assert_select "input#usuario_token[name=?]", "usuario[token]"
    end
  end
end
