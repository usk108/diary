class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.datetime :date

      t.timestamps
    end
  end
end
