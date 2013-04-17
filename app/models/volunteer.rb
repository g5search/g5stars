#require 'curb'
require 'open-uri'
require 'nokogiri'
require 'nameize'

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
  MANAGEMENT_URL = 'http://www.getg5.com/about/management-team'

  def self.nice_guys
    self.joins(:stars).merge(Star.this_year).select("distinct(volunteers.id)")
  end

  def full_name
    "#{first_name} #{last_name}".nameize
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
    unless self.photo_url.present?
      name_regexp = /#{Regexp.escape(first_name)}\s+#{Regexp.escape(last_name)}/
      begin
        #curl = Curl::Easy.perform(BASE_URL)
        begin
          doc = Nokogiri::HTML(open(BASE_URL))
          photo_url = doc.css('a.profile-link').find{|img| img.css('h4').text.match(name_regexp)}.css("img").attr("src").value
          self.update_attribute(:photo_url, photo_url)
        rescue
          doc = Nokogiri::HTML(open(MANAGEMENT_URL))
          photo_url = 'http://www.getg5.com'.concat doc.css('div.g5-people').find{|nodes| nodes.css('a').text.match(name_regexp)}.css("img").attr("src").value
          self.update_attribute(:photo_url, photo_url)
        end
      rescue
        self.update_attribute(:photo_url, "space_stallions.gif")
      end
    end
  end
end
