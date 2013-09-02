class CreatePingRecords < ActiveRecord::Migration
  def change
    create_table :ping_records do |t|
    	t.integer :host_id
      t.timestamps
    end
  end
end
