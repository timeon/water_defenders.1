require 'rails_helper'

RSpec.describe "trackings/index", type: :view do
  before(:each) do
    assign(:trackings, [
      Tracking.create!(
        :area => "Area",
        :usage => "Usage",
        :value => 2,
        :unit => "Unit",
        :user => nil
      ),
      Tracking.create!(
        :area => "Area",
        :usage => "Usage",
        :value => 2,
        :unit => "Unit",
        :user => nil
      )
    ])
  end

  it "renders a list of trackings" do
    render
    assert_select "tr>td", :text => "Area".to_s, :count => 2
    assert_select "tr>td", :text => "Usage".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Unit".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
