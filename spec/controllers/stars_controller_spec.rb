require 'spec_helper'

describe StarsController do
  login_user

  before do
    @volunteer = FactoryGirl.create(:volunteer)
  end

  describe "GET 'new'" do

    it "returns http success" do
      get 'new', :volunteer_id => @volunteer.id
      debugger
      response.should be_success
    end

  end

  describe "GET 'destroy'" do
    it "returns http success" do
      get 'destroy', :volunteer_id => @volunteer.id,
                     :id => FactoryGirl.create(:star, :volunteer => @volunteer)
      response.should be_success
    end

    it "destroys the appropriate star" do
      star = FactoryGirl.create(:star, :volunteer => @volunteer)
      star2 = FactoryGirl.create(:star, :volunteer => @volunteer)
      expect {get 'destroy', :volunteer_id => @volunteer.id,
                             :id => star.id}.to change(Star, :count).by(-1)
      @volunteer.stars.should_not include(star)
    end

  end
end
