require 'rails_helper'

describe "adding a review" do
  it "allows a signed in user to add a review" do
    User.create(email: 'test@email.com', password: 'password')
    visit '/'
    fill_in 'Email', with: 'test@email.com'
    fill_in 'Password', with: 'password'
    click_button 'Log In'
    res = Restaurant.create(name: 'Testaurant', description: 'description')
    res.reviews.create(review_details: 'loved it!', rating: 1)
    visit "/restaurants/#{res.id}/reviews"
    page.should have_content '1'
  end
end
