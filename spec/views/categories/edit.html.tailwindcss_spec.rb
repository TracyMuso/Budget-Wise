require 'rails_helper'

RSpec.describe 'categories/edit', type: :view do
  let(:category) do
    Category.create!(
      name: 'MyString',
      amount: 1,
      user: nil
    )
  end

  before(:each) do
    assign(:category, category)
  end

  it 'renders the edit category form' do
    render

    assert_select 'form[action=?][method=?]', category_path(category), 'post' do
      assert_select 'input[name=?]', 'category[name]'

      assert_select 'input[name=?]', 'category[amount]'

      assert_select 'input[name=?]', 'category[user_id]'
    end
  end
end
