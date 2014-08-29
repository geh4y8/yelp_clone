class AddUserPhoto < ActiveRecord::Migration
  def change
    add_attachment :users, :user_photo
  end
end
