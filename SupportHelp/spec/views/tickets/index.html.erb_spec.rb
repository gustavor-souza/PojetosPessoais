require 'rails_helper'

RSpec.describe "tickets/index", :type => :view do
  before(:each) do
    assign(:tickets, [
      Ticket.create!(
        :title => "Title",
        :active => false,
        :System => "",
        :Subject => "",
        :Priority => ""
      ),
      Ticket.create!(
        :title => "Title",
        :active => false,
        :System => "",
        :Subject => "",
        :Priority => ""
      )
    ])
  end

  it "renders a list of tickets" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
