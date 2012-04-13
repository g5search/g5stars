require 'spec_helper'

describe "volunteers/index" do
  before(:each) do
    volunteer = FactoryGirl.create(:volunteer, first_name: "Colton", last_name: "Fent")
    FactoryGirl.create(:star, volunteer: volunteer)
    assign(:volunteers, [volunteer])
  end

  it "renders a list of volunteers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Colton".to_s, :count => 1
    assert_select "tr>td", :text => "Fent".to_s, :count => 1
    rendered.should have_selector(".star")
  end
end
