class CreateActivities < ActiveRecord::Migration
  def up
    create_table :activities do |t|
      t.string :name
      t.text :description

      t.timestamps
    end

  end
  def down
    drop_table :activities
  end
end
