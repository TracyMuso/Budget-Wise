require 'rails_helper'

RSpec.describe 'group_categories/show', type: :view do
  before(:each) do
    assign(:group_category, GroupCategory.create!(
                              group: nil,
                              category: nil
                            ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
