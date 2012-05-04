class Activity < ActiveRecord::Base
  attr_accessible :description, :name, :stars_attributes
  validates_presence_of :name

  has_many :volunteers, :through => :stars
  has_many :stars
  accepts_nested_attributes_for :stars, allow_destroy: true

  def initialized_stars
    [].tap do |o|
      Volunteer.all.each do |volunteer|
        if star = stars.find { |star| star.volunteer_id == volunteer.id }
          o << star.tap { |star| star.enable ||= true }
        else
          o << Star.new(volunteer: volunteer, board_member: false)
        end
      end
    end
  end

end
