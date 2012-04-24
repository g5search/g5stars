require 'spec_helper'

describe Activity do
  describe "validations" do
    it "can't save without a name" do
      a = Activity.new
      a.should_not be_valid
      a.errors[:name].should_not be_empty
    end
  end
end