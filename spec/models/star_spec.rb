require 'spec_helper'

describe Star do
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
end
