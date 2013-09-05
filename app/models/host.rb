class Host < ActiveRecord::Base
	has_many :ping_records, :order => 'created_at desc'
end
