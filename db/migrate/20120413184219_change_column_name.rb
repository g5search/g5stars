class ChangeColumnName < ActiveRecord::Migration
  def up
    change_column :stars, :employee_id, :volunteer_id if column_exists?(:stars, :employee_id)
  end

  def down
    change_column :stars, :volunteer_id, :employee_id
  end
end
