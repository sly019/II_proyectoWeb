require 'rails_helper'

RSpec.describe "sessions/index", type: :view do
  before(:each) do
    assign(:sessions, [
      Session.create!(
        :username => "Username",
        :token => "Token"
      ),
      Session.create!(
        :username => "Username",
        :token => "Token"
      )
    ])
  end

  it "renders a list of sessions" do
    render
    assert_select "tr>td", :text => "Username".to_s, :count => 2
    assert_select "tr>td", :text => "Token".to_s, :count => 2
  end
end
