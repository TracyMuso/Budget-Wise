require 'rails_helper'

RSpec.describe 'categories/new', type: :view do
  before(:each) do
    assign(:category, Category.new(
                        name: 'MyString',
                        amount: 1,
                        user: nil
                      ))
  end

  it 'renders new category form' do
    render

    assert_select 'form[action=?][method=?]', categories_path, 'post' do
      assert_select 'input[name=?]', 'category[name]'

      assert_select 'input[name=?]', 'category[amount]'

      assert_select 'input[name=?]', 'category[user_id]'
    end
  end
end
