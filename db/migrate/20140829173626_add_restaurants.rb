class AddRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :description
      t.attachment :restaurant_photo
    end
  end
end
