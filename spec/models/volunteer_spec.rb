require 'spec_helper'

describe Volunteer do

  context "validations" do
    it "Can't create a volunteer without a first name" do
      v = Volunteer.new
      v.should_not be_valid
      v.errors[:first_name].should_not be_empty
    end

    it "Can't create a volunteer without a last name" do
      v = Volunteer.new
      v.should_not be_valid
      v.errors[:last_name].should_not be_empty
    end
  end
  describe "associations" do
    it "has many stars" do
      volunteer = FactoryGirl.create(:volunteer)
      star = FactoryGirl.create(:star, :volunteer => volunteer)
      volunteer.should respond_to(:stars)
    end
    it "has many activities through stars" do
      volunteer = FactoryGirl.create(:volunteer_who_donated_blood)
      volunteer.activities.first.name.should == "Donated Blood"
    end
  end

  describe "#full_name" do
    it "should combine the first and last name into one glorious ultra name" do
      volunteer = Volunteer.new(first_name: "Michael", last_name: "Mitchell")
      volunteer.full_name.should == "Michael Mitchell"
    end
    it "should capitalize lowercased names" do
      volunteer = FactoryGirl.create(:volunteer, :first_name => "michael", :last_name => "mitchell")
      volunteer.full_name.should == "Michael Mitchell"
    end
  end
end
