class ChangeAuthorForeignKeyToUserIdInLikes < ActiveRecord::Migration[7.0]
  def change
    rename_column :likes, :author_id, :user_id
  end
end
