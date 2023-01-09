require 'rails_helper'

RSpec.describe 'group_categories/index', type: :view do
  before(:each) do
    assign(:group_categories, [
             GroupCategory.create!(
               group: nil,
               category: nil
             ),
             GroupCategory.create!(
               group: nil,
               category: nil
             )
           ])
  end

  it 'renders a list of group_categories' do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
