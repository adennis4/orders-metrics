class DropWeathersTable < ActiveRecord::Migration
  def change
    drop_table :weathers
  end
end
