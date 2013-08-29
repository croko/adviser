require 'spec_helper'

describe "admin/ads/edit" do
  before(:each) do
    @admin_ad = assign(:admin_ad, stub_model(Admin::Ad))
  end

  it "renders the edit admin_ad form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", admin_ad_path(@admin_ad), "post" do
    end
  end
end
