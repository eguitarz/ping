class AddResponseMsToPingRecords < ActiveRecord::Migration
  def change
  	add_column :ping_records, :response_ms, :integer
  end
end
