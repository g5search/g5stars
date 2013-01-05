#require 'curb'
require 'open-uri'
require 'nokogiri'

class Volunteer < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :photo_url
  validates_presence_of :first_name, :last_name
  has_many :stars
  has_many :activities, :through => :stars

  after_create :go_get_the_picture_from_g5s_site

  scope :by_stars, select("volunteers.*, count(stars.id) as stars_count").
                   joins("LEFT JOIN stars ON volunteers.id = stars.volunteer_id").
                   group('volunteers.first_name, volunteers.last_name, volunteers.id, volunteers.photo_url, volunteers.created_at, volunteers.updated_at').
                   order("stars_count DESC, first_name, last_name")

  BASE_URL = 'http://www.getg5.com/about/g5-team'

  def self.nice_guys
    self.joins(:stars).select("distinct(volunteers.id)")
  end

  def full_name
    "#{first_name.slice(0,1).capitalize + first_name.slice(1..-1)} #{last_name.capitalize}"
  end

  def self.all_volunteer
    self.all
  end

  def self.participation
    (self.nice_guys.count*100).to_f / self.all_volunteer.count.to_f
  end

  def reprocess_picture
    go_get_the_picture_from_g5s_site
  end

protected

  def go_get_the_picture_from_g5s_site
    begin
      #curl = Curl::Easy.perform(BASE_URL)
      doc = Nokogiri::HTML(open(BASE_URL))
      photo_url = doc.css('a.profile-link').find{|img| img.css('h4').text == "#{full_name}"}.css("img").attr("src").value
    rescue
      self.update_attribute(:photo_url, "space_stallions.gif")
    else
      self.update_attribute(:photo_url, photo_url)
    end
  end

end
