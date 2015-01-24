require 'rails_helper'

RSpec.describe "tickets/new", :type => :view do
  before(:each) do
    assign(:ticket, Ticket.new(
      :title => "MyString",
      :active => false,
      :System => "",
      :Subject => "",
      :Priority => ""
    ))
  end

  it "renders new ticket form" do
    render

    assert_select "form[action=?][method=?]", tickets_path, "post" do

      assert_select "input#ticket_title[name=?]", "ticket[title]"

      assert_select "input#ticket_active[name=?]", "ticket[active]"

      assert_select "input#ticket_System[name=?]", "ticket[System]"

      assert_select "input#ticket_Subject[name=?]", "ticket[Subject]"

      assert_select "input#ticket_Priority[name=?]", "ticket[Priority]"
    end
  end
end
