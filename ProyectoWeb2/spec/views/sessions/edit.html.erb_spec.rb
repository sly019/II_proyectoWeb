require 'rails_helper'

RSpec.describe "sessions/edit", type: :view do
  before(:each) do
    @session = assign(:session, Session.create!(
      :username => "MyString",
      :token => "MyString"
    ))
  end

  it "renders the edit session form" do
    render

    assert_select "form[action=?][method=?]", session_path(@session), "post" do

      assert_select "input#session_username[name=?]", "session[username]"

      assert_select "input#session_token[name=?]", "session[token]"
    end
  end
end
