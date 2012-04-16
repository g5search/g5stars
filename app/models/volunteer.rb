require 'curb'
require 'nokogiri'

class Volunteer < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :photo_url
  validates_presence_of :first_name, :last_name
  has_many :stars
  after_create :go_get_the_picture_from_g5s_site
  
  BASE_URL = 'http://www.g5platform.com/g5_team'
  
  def full_name
    "#{first_name} #{last_name}"
  end
  
protected

  def go_get_the_picture_from_g5s_site
    begin
      curl = Curl::Easy.perform(BASE_URL)
      doc = Nokogiri::HTML(curl.body_str)
      photo_url = doc.css('.vcard').find{|div| div.css('span').text == "#{full_name}"}.css('img').first['src'].split("?")[0]
    rescue
      self.update_attribute(:photo_url, "space_stallions.gif")
    else
      self.update_attribute(:photo_url, photo_url)
    end
  end
    
end
