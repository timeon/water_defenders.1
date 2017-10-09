require 'rails_helper'

RSpec.describe "blogs/new", type: :view do
  before(:each) do
    assign(:blog, Blog.new(
      :user => nil,
      :title => "MyString",
      :body => "MyText"
    ))
  end

  it "renders new blog form" do
    render

    assert_select "form[action=?][method=?]", blogs_path, "post" do

      assert_select "input#blog_user_id[name=?]", "blog[user_id]"

      assert_select "input#blog_title[name=?]", "blog[title]"

      assert_select "textarea#blog_body[name=?]", "blog[body]"
    end
  end
end
