#require 'curb'
require 'open-uri'
require 'nokogiri'

class Volunteer < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :photo_url
  validates_presence_of :first_name, :last_name
  has_many :stars
  has_many :activities, :through => :stars

  after_create :go_get_the_picture_from_g5s_site

  BASE_URL = 'http://www.g5platform.com/g5_team'

  def self.nice_guys
    self.joins(:stars).select("distinct(volunteers.id)")
  end

  def full_name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end

  def self.all_volunteer
    self.all
  end

  def self.participation
    (self.nice_guys.count*100).to_f / self.all_volunteer.count.to_f 
  end

protected

  def go_get_the_picture_from_g5s_site
    begin
      #curl = Curl::Easy.perform(BASE_URL)
      doc = Nokogiri::HTML(open(BASE_URL))
      photo_url = doc.css('.vcard').find{|div| div.css('span').text == "#{full_name}"}.css('img').first['src'].split("?")[0]
    rescue
      self.update_attribute(:photo_url, "space_stallions.gif")
    else
      self.update_attribute(:photo_url, photo_url)
    end
  end

end
