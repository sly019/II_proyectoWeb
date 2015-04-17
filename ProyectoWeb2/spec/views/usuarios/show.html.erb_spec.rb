require 'rails_helper'

RSpec.describe "usuarios/show", type: :view do
  before(:each) do
    @usuario = assign(:usuario, Usuario.create!(
      :username => "Username",
      :password_hast => "Password Hast",
      :password_salt => "Password Salt",
      :token => "Token"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Username/)
    expect(rendered).to match(/Password Hast/)
    expect(rendered).to match(/Password Salt/)
    expect(rendered).to match(/Token/)
  end
end
