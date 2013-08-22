require 'spec_helper'

describe "contents/edit" do
  before(:each) do
    @content = assign(:content, stub_model(Content,
      :name => "MyString",
      :announce => "MyString",
      :body => "MyText",
      :page => nil
    ))
  end

  it "renders the edit content form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", content_path(@content), "post" do
      assert_select "input#content_name[name=?]", "content[name]"
      assert_select "input#content_announce[name=?]", "content[announce]"
      assert_select "textarea#content_body[name=?]", "content[body]"
      assert_select "input#content_page[name=?]", "content[page]"
    end
  end
end
