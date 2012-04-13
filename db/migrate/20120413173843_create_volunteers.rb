class CreateVolunteers < ActiveRecord::Migration
  def change
    create_table :volunteers do |t|
      t.string :first_name
      t.string :last_name
      t.string :photo_url

      t.timestamps
    end
  end
end
