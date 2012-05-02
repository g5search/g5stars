class CreateDonations < ActiveRecord::Migration
  def change
    create_table :donations do |t|
      t.string :recipient
      t.integer :value

      t.timestamps
    end
  end
end
