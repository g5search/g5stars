require 'spec_helper'

describe Star do
  describe "validations" do
    # it "can't save without activity_name" do
    #   s = Star.new
    #   s.should_not be_valid
    #   s.errors[:activity_name].should_not be_empty
    # end
    # it "can't save without time_spent" do
    #   s = Star.new
    #   s.should_not be_valid
    #   s.errors[:time_spent].should_not be_empty
    # end
    it "can't save time that isn't a number" do
      s = Star.new
      s.time_spent = "booger"
      s.should_not be_valid
      s.errors[:time_spent].should_not be_empty
    end
  end

  describe "ordered" do
    before do
      @volunteer = FactoryGirl.create(:volunteer)
      @bs_1 = FactoryGirl.create(:star, volunteer: @volunteer, board_member: true)
      @vs_1 = FactoryGirl.create(:star, volunteer: @volunteer, board_member: false)
      @bs_2 = FactoryGirl.create(:star, volunteer: @volunteer, board_member: true)
      @activity = FactoryGirl.create(:activity)
      @bs_1.activity = @activity
    end

    it "orders the stars from board to volunteer" do
      Star.ordered.should == [@bs_1, @bs_2, @vs_1]
    end

    it "belongs to a volunteer" do
      @bs_1.volunteer.should == @volunteer
    end

    it "belongs to an activity" do
      @bs_1.activity.should == @activity
    end
  end

  describe ".this_year" do
    it "gets a list of stars from the current year" do
      star1 = FactoryGirl.create(:star, created_at: Date.today.prev_year)
      star2 = FactoryGirl.create(:star,created_at: Date.today.end_of_year)
      Star.this_year.should_not include(star1)
      Star.this_year.should include(star2)
    end
  end
end
