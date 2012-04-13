require 'spec_helper'

describe Star do
  describe "ordered" do
    before do
      @volunteer = FactoryGirl.create(:volunteer)
      @bs_1 = FactoryGirl.create(:star, volunteer: @volunteer, board_member: true)
      @vs_1 = FactoryGirl.create(:star, volunteer: @volunteer, board_member: false)
      @bs_2 = FactoryGirl.create(:star, volunteer: @volunteer, board_member: true)
    end
    it "orders the stars from board to volunteer" do
      Star.ordered.should == [@bs_1, @bs_2, @vs_1]
    end
  end
end
