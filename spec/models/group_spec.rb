require 'rails_helper'

RSpec.describe Group, type: :model do
  it 'is not valid without a name' do
    group = Group.new(name: nil)
    expect(group).to_not be_valid
  end
end
