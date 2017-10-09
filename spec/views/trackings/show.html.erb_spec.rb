require 'rails_helper'

RSpec.describe "trackings/show", type: :view do
  before(:each) do
    @tracking = assign(:tracking, Tracking.create!(
      :area => "Area",
      :usage => "Usage",
      :value => 2,
      :unit => "Unit",
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Area/)
    expect(rendered).to match(/Usage/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Unit/)
    expect(rendered).to match(//)
  end
end
