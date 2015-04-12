require 'rails_helper'

RSpec.describe "sessions/new", type: :view do
  before(:each) do
    assign(:session, Session.new(
      :username => "MyString",
      :token => "MyString"
    ))
  end

  it "renders new session form" do
    render

    assert_select "form[action=?][method=?]", sessions_path, "post" do

      assert_select "input#session_username[name=?]", "session[username]"

      assert_select "input#session_token[name=?]", "session[token]"
    end
  end
end
