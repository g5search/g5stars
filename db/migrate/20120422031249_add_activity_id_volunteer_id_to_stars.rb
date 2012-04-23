class AddActivityIdVolunteerIdToStars < ActiveRecord::Migration
  def change
    add_column :stars, :activity_id, :integer
  end
end
