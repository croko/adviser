require 'spec_helper'

describe "contents/show" do
  before(:each) do
    @content = assign(:content, stub_model(Content,
      :name => "Name",
      :announce => "Announce",
      :body => "MyText",
      :page => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Announce/)
    rendered.should match(/MyText/)
    rendered.should match(//)
  end
end
