require 'spec_helper'

describe "admin/ads/new" do
  before(:each) do
    assign(:admin_ad, stub_model(Admin::Ad).as_new_record)
  end

  it "renders new admin_ad form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", admin_ads_path, "post" do
    end
  end
end
