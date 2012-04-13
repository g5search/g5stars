class Star < ActiveRecord::Base
  belongs_to :volunteer
  attr_accessible :activity, :board_member
end
