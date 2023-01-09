require 'rails_helper'

RSpec.describe 'group_categories/new', type: :view do
  before(:each) do
    assign(:group_category, GroupCategory.new(
                              group: nil,
                              category: nil
                            ))
  end

  it 'renders new group_category form' do
    render

    assert_select 'form[action=?][method=?]', group_categories_path, 'post' do
      assert_select 'input[name=?]', 'group_category[group_id]'

      assert_select 'input[name=?]', 'group_category[category_id]'
    end
  end
end
