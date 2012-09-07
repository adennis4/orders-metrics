class CreateWeathers < ActiveRecord::Migration
  def change
    create_table :weathers do |t|
      t.integer :location_id
      t.integer :temperature
      t.string :condition

      t.timestamps
    end
  end
end
