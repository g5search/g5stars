class AddDonationDateColumnToDonations < ActiveRecord::Migration
  def change
    add_column :donations, :donation_time, :datetime
  end
end
