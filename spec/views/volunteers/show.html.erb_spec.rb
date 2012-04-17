require 'spec_helper'

describe "volunteers/show" do
  login_user
  
  before(:each) do
    @volunteer = assign(:volunteer, stub_model(Volunteer,
      :first_name => "First Name",
      :last_name => "Last Name",
      :photo_url => "Photo Url"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/First Name/)
    rendered.should match(/Last Name/)
    rendered.should match(/Photo Url/)
  end
end
