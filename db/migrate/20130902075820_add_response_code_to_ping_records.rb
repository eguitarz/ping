class AddResponseCodeToPingRecords < ActiveRecord::Migration
  def change
  	add_column :ping_records, :response_code, :integer
  end
end
