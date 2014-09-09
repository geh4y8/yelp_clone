require 'rails_helper'

describe Restaurant do
  it { should validate_presence_of(:restaurant_photo) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:description) }
end
