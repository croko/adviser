require 'spec_helper'

describe "admin/ads/show" do
  before(:each) do
    @admin_ad = assign(:admin_ad, stub_model(Admin::Ad))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
