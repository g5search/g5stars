class CreateStars < ActiveRecord::Migration
  def change
    create_table :stars do |t|
      t.belongs_to :volunteer
      t.string :activity
      t.boolean :board_member

      t.timestamps
    end
    add_index :stars, :volunteer_id
  end
end
