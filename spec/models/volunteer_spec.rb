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
  
  describe "#full_name" do
    it "should combine the first and last name into one glorious ultra name" do
      v = Volunteer.new(first_name: "Michael", last_name: "Mitchell")
      v.full_name.should == "Michael Mitchell"
    end
  end
end
