class Donation < ActiveRecord::Base
  attr_accessible :recipient, :value
  
  def self.total_donated
    self.all.sum(&:value).to_s
  end
end