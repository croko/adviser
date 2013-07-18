require 'spec_helper'

describe "clinics/show" do
  before(:each) do
    @clinic = assign(:clinic, stub_model(Clinic,
      :name => "Name",
      :description => "MyText",
      :status => "Status",
      :user_id => 1,
      :published => false,
      :reviews_count => 2,
      :rating => 1.5,
      :likes_count => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/MyText/)
    rendered.should match(/Status/)
    rendered.should match(/1/)
    rendered.should match(/false/)
    rendered.should match(/2/)
    rendered.should match(/1.5/)
    rendered.should match(/3/)
  end
end
