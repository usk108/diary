class Record < ActiveRecord::Base
	has_one :memo, dependent: :destroy 
    accepts_nested_attributes_for :memo
end
