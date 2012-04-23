require 'ruby-debug'

class AddActivityIdVolunteerIdToStars < ActiveRecord::Migration
  def up
    add_column :stars, :activity_id, :integer
    Star.reset_column_information 
    stars = Star.all
    stars.each do |star|
      debugger
      activity_name = execute("SELECT stars.activity FROM stars where stars.id = #{star.id}").first[0]
      activity = Activity.find_or_create_by_name(activity_name)
      star.activity = activity
      star.save
    end
  end

  def down
    remove_column :stars, :activity_id
  end

end
