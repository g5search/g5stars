require 'spec_helper'

describe Volunteer do
  context "validations" do
    it "Can't create a volunteer without a first name" do
      v = Volunteer.new
      v.should_not be_valid
      v.errors[:first_name].should_not be_empty
    end
    it "Can't create a volunteer without a first name" do
      v = Volunteer.new
      v.should_not be_valid
      v.errors[:last_name].should_not be_empty
    end
  end
  describe "associations" do
    it "has many stars" do
      v = FactoryGirl.create(:volunteer)
      star = FactoryGirl.create(:star, :volunteer => v)
      v.should respond_to(:stars)
      v.stars.first.activity.should == "tie my shoes"
    end
  end
end
