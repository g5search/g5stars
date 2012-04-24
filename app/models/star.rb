class Star < ActiveRecord::Base
  belongs_to :volunteer
  belongs_to :activity
  validates_presence_of :time_spent, :activity_name

  attr_accessible :activity, :board_member, :activity_name, :time_spent

  scope :ordered, order("board_member DESC")
  scope :donated_blood, joins(:activity).where("name like ?", "%Blood%")
    
  def self.donated_hours
    self.all.sum(&:time_spent).to_s
  end
  
  def activity_name
    activity.try(:name)
  end

  def activity_name=(name)
    self.activity = Activity.find_or_create_by_name(name) if name.present?
  end
end
