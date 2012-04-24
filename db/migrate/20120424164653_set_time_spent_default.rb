class SetTimeSpentDefault < ActiveRecord::Migration
  def up
    change_column(:stars, :time_spent, :decimal, :precision => 5, :scale => 2, :default => 1.0)
  end

  def down
    change_column(:stars, :time_spent, :integer, :default => false)
  end
end
