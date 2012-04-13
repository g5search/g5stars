class Volunteer < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :photo_url
  validates_presence_of :first_name, :last_name
  has_many :stars
end
