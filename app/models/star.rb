class Star < ActiveRecord::Base
  belongs_to :volunteer
  belongs_to :activity

  attr_accessible :activity, :board_member, :activity_name

  scope :ordered, order("board_member DESC")
    
  def self.donated_blood
    self.joins(:activity).where("name like ?", "%blood%")
  end
  
  def activity_name
    activity.try(:name)
  end

  def activity_name=(name)
    self.activity = Activity.find_or_create_by_name(name) if name.present?
  end
end
