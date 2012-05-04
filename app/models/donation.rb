class Donation < ActiveRecord::Base
  attr_accessible :recipient, :value, :donation_time
  
  def self.total_donated
    self.all.sum(&:value).to_s
  end
end