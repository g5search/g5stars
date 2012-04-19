class AddTimeSpentToStars < ActiveRecord::Migration
  def change
    add_column :stars, :time_spent, :integer
  end
end
