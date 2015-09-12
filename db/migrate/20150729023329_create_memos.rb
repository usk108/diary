class CreateMemos < ActiveRecord::Migration
  def change
    create_table :memos do |t|
      t.text :sentence

      t.timestamps
    end
  end
end
