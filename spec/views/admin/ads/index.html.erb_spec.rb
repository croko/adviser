require 'spec_helper'

describe "admin/ads/index" do
  before(:each) do
    assign(:admin_ads, [
      stub_model(Admin::Ad),
      stub_model(Admin::Ad)
    ])
  end

  it "renders a list of admin/ads" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
