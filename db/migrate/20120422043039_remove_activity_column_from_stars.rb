class RemoveActivityColumnFromStars < ActiveRecord::Migration
  def up
    remove_column :stars, :activity
  end

  def down
  end
end
