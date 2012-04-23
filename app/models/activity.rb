class Activity < ActiveRecord::Base
  attr_accessible :description, :name

  has_many :volunteers, :through => :stars
  has_many :stars
end
