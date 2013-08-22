require 'spec_helper'

describe "contents/new" do
  before(:each) do
    assign(:content, stub_model(Content,
      :name => "MyString",
      :announce => "MyString",
      :body => "MyText",
      :page => nil
    ).as_new_record)
  end

  it "renders new content form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", contents_path, "post" do
      assert_select "input#content_name[name=?]", "content[name]"
      assert_select "input#content_announce[name=?]", "content[announce]"
      assert_select "textarea#content_body[name=?]", "content[body]"
      assert_select "input#content_page[name=?]", "content[page]"
    end
  end
end
