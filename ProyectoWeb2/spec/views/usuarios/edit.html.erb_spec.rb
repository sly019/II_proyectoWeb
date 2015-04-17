require 'rails_helper'

RSpec.describe "usuarios/edit", type: :view do
  before(:each) do
    @usuario = assign(:usuario, Usuario.create!(
      :username => "MyString",
      :password_hast => "MyString",
      :password_salt => "MyString",
      :token => "MyString"
    ))
  end

  it "renders the edit usuario form" do
    render

    assert_select "form[action=?][method=?]", usuario_path(@usuario), "post" do

      assert_select "input#usuario_username[name=?]", "usuario[username]"

      assert_select "input#usuario_password_hast[name=?]", "usuario[password_hast]"

      assert_select "input#usuario_password_salt[name=?]", "usuario[password_salt]"

      assert_select "input#usuario_token[name=?]", "usuario[token]"
    end
  end
end
