class Host < ActiveRecord::Base
	has_many :ping_records
end
