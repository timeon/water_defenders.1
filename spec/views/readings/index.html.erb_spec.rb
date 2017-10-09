require 'rails_helper'

RSpec.describe "readings/index", type: :view do
  before(:each) do
    assign(:readings, [
      Reading.create!(
        :value => 2,
        :unit => "Unit",
        :user => nil
      ),
      Reading.create!(
        :value => 2,
        :unit => "Unit",
        :user => nil
      )
    ])
  end

  it "renders a list of readings" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Unit".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
