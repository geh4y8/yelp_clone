class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :review_details
      t.string :rating
      t.belongs_to :user
      t.belongs_to :restaurant
    end
  end
end
