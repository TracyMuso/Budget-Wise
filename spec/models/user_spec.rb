require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is not valid without a first name' do
    user = User.new(name: nil, email: 'name@mail.com', password: 'password')
    expect(user).to_not be_valid
  end
end
