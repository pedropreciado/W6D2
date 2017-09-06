class AddForeignKeys < ActiveRecord::Migration[5.1]
  def change
      add_column :polls, :author_id, :integer
      add_column :questions, :poll_id, :integer
  end
end
