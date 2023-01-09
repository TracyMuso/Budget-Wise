require 'rails_helper'

RSpec.describe "group_categories/edit", type: :view do
  let(:group_category) {
    GroupCategory.create!(
      group: nil,
      category: nil
    )
  }

  before(:each) do
    assign(:group_category, group_category)
  end

  it "renders the edit group_category form" do
    render

    assert_select "form[action=?][method=?]", group_category_path(group_category), "post" do

      assert_select "input[name=?]", "group_category[group_id]"

      assert_select "input[name=?]", "group_category[category_id]"
    end
  end
end
