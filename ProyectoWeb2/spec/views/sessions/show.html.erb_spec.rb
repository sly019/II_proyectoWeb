require 'rails_helper'

RSpec.describe "sessions/show", type: :view do
  before(:each) do
    @session = assign(:session, Session.create!(
      :username => "Username",
      :token => "Token"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Username/)
    expect(rendered).to match(/Token/)
  end
end
