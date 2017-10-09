require 'rails_helper'

RSpec.describe "blogs/index", type: :view do
  before(:each) do
    assign(:blogs, [
      Blog.create!(
        :user => nil,
        :title => "Title",
        :body => "MyText"
      ),
      Blog.create!(
        :user => nil,
        :title => "Title",
        :body => "MyText"
      )
    ])
  end

  it "renders a list of blogs" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
