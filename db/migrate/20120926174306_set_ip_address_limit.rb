class SetIpAddressLimit < ActiveRecord::Migration
  def change
    change_column :bookings, :ip_address, :string, :limit => 20
  end
end
