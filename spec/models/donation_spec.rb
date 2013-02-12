require 'spec_helper'

describe Donation do
  describe ".this_year" do
    it "only shows donations from this year" do
      donation1 = FactoryGirl.create(:donation, created_at: Date.today.prev_year)
      donation2 = FactoryGirl.create(:donation)
      Donation.this_year.should include(donation2)
      Donation.this_year.should_not include(donation1)
    end
  end
end