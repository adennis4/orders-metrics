class CreateCancellations < ActiveRecord::Migration
  def change
    create_table :cancellations do |t|
      t.string :name
      t.float :metric_1

      t.timestamps
    end
  end
end
