require 'rails_helper'

RSpec.describe "tickets/edit", :type => :view do
  before(:each) do
    @ticket = assign(:ticket, Ticket.create!(
      :title => "MyString",
      :active => false,
      :System => "",
      :Subject => "",
      :Priority => ""
    ))
  end

  it "renders the edit ticket form" do
    render

    assert_select "form[action=?][method=?]", ticket_path(@ticket), "post" do

      assert_select "input#ticket_title[name=?]", "ticket[title]"

      assert_select "input#ticket_active[name=?]", "ticket[active]"

      assert_select "input#ticket_System[name=?]", "ticket[System]"

      assert_select "input#ticket_Subject[name=?]", "ticket[Subject]"

      assert_select "input#ticket_Priority[name=?]", "ticket[Priority]"
    end
  end
end
