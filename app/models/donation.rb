class Donation < ActiveRecord::Base
  attr_accessible :recipient, :value, :donation_time

  scope :this_year, where(created_at: Date.today.beginning_of_year.beginning_of_day..Date.today.end_of_year.end_of_day)

  def self.total_donated
    self.all.sum(&:value).to_s
  end
end