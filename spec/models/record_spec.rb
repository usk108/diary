require 'spec_helper'

describe Record do
  it "returns date as a string" do 
    # record = Record.new(date: "2015-09-08 21:10:40 +0900")
    record = build(:record, date: "2015-09-08 21:10:40 +0900")
    expect(record.show_date).to eq '2015年9月8日'
  end
end
