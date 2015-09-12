class Record < ActiveRecord::Base
	has_one :memo, dependent: :destroy 
  accepts_nested_attributes_for :memo

  def show_date
  	"#{self.date.year}年#{self.date.month}月#{self.date.day}日"
  end
end
