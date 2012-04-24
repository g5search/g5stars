class Activity < ActiveRecord::Base
  attr_accessible :description, :name
  validates_presence_of :name

  has_many :volunteers, :through => :stars
  has_many :stars
  
end
