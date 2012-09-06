class DropCancellationsTable < ActiveRecord::Migration
  def change
    drop_table :cancellations
  end
end
