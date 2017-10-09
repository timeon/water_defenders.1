require 'rails_helper'

RSpec.describe "readings/new", type: :view do
  before(:each) do
    assign(:reading, Reading.new(
      :value => 1,
      :unit => "MyString",
      :user => nil
    ))
  end

  it "renders new reading form" do
    render

    assert_select "form[action=?][method=?]", readings_path, "post" do

      assert_select "input#reading_value[name=?]", "reading[value]"

      assert_select "input#reading_unit[name=?]", "reading[unit]"

      assert_select "input#reading_user_id[name=?]", "reading[user_id]"
    end
  end
end
