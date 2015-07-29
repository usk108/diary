class Memo < ActiveRecord::Base
	belongs_to :record	
    accepts_nested_attributes_for :record
end
