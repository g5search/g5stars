class AddActivityIdVolunteerIdToStars < ActiveRecord::Migration
  def up
    add_column :stars, :activity_id, :integer
    Star.reset_column_information 
    stars = Star.all
    stars.each do |star|
      activity = Activity.find_or_create_by_name_and_description(star.name, star.description)
      star.activity = activity
      star.save
    end
  end

  def down
    remove_column :stars, :activity_id
  end

end
