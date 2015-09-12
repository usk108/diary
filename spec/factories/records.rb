# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :record do
    date '2015-09-08 21:10:40 +0900'

    # after(:build,:create) do |record|
    #   record.memo << FactoryGirl.build(record_id: record.id)
    # end
  end
end
