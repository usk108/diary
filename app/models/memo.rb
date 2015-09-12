class Memo < ActiveRecord::Base
  validates :sentence, presence: true
  validates :record_id, uniqueness: true
	belongs_to :record	
    accepts_nested_attributes_for :record
end
