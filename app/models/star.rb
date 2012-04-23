class Star < ActiveRecord::Base
  belongs_to :volunteer
  belongs_to :activity

  attr_accessible :activity, :board_member

  scope :ordered, order("board_member DESC")

end
