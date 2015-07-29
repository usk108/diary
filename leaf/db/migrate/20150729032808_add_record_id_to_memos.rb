class AddRecordIdToMemos < ActiveRecord::Migration
  def change
    add_column :memos, :record_id, :integer
  end
end
