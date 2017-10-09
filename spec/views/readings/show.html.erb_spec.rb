require 'rails_helper'

RSpec.describe "readings/show", type: :view do
  before(:each) do
    @reading = assign(:reading, Reading.create!(
      :value => 2,
      :unit => "Unit",
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Unit/)
    expect(rendered).to match(//)
  end
end
