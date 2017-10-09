require 'rails_helper'

RSpec.describe "trackings/new", type: :view do
  before(:each) do
    assign(:tracking, Tracking.new(
      :area => "MyString",
      :usage => "MyString",
      :value => 1,
      :unit => "MyString",
      :user => nil
    ))
  end

  it "renders new tracking form" do
    render

    assert_select "form[action=?][method=?]", trackings_path, "post" do

      assert_select "input#tracking_area[name=?]", "tracking[area]"

      assert_select "input#tracking_usage[name=?]", "tracking[usage]"

      assert_select "input#tracking_value[name=?]", "tracking[value]"

      assert_select "input#tracking_unit[name=?]", "tracking[unit]"

      assert_select "input#tracking_user_id[name=?]", "tracking[user_id]"
    end
  end
end
