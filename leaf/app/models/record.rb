class Record < ActiveRecord::Base
	has_one :memo, dependent: :destroy 
    accepts_nested_attributes_for :memo

    # def date_string
    # 	"#{m.rerord.date.year}年#{m.rerord.date.month}月#{m.rerord.date.day}日"
    # end
end
