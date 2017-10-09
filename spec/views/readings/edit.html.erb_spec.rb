require 'rails_helper'

RSpec.describe "readings/edit", type: :view do
  before(:each) do
    @reading = assign(:reading, Reading.create!(
      :value => 1,
      :unit => "MyString",
      :user => nil
    ))
  end

  it "renders the edit reading form" do
    render

    assert_select "form[action=?][method=?]", reading_path(@reading), "post" do

      assert_select "input#reading_value[name=?]", "reading[value]"

      assert_select "input#reading_unit[name=?]", "reading[unit]"

      assert_select "input#reading_user_id[name=?]", "reading[user_id]"
    end
  end
end
