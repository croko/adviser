require 'spec_helper'

describe "addresses/index" do
  before(:each) do
    assign(:addresses, [
      stub_model(Address,
        :phone_number => "Phone Number",
        :mobile_phone_number => "Mobile Phone Number",
        :address_1 => "Address 1",
        :address_2 => "Address 2",
        :city => "City",
        :state => "State",
        :zip_code => "Zip Code",
        :addressable_id => 1,
        :addressable_type => "Addressable Type"
      ),
      stub_model(Address,
        :phone_number => "Phone Number",
        :mobile_phone_number => "Mobile Phone Number",
        :address_1 => "Address 1",
        :address_2 => "Address 2",
        :city => "City",
        :state => "State",
        :zip_code => "Zip Code",
        :addressable_id => 1,
        :addressable_type => "Addressable Type"
      )
    ])
  end

  it "renders a list of addresses" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Phone Number".to_s, :count => 2
    assert_select "tr>td", :text => "Mobile Phone Number".to_s, :count => 2
    assert_select "tr>td", :text => "Address 1".to_s, :count => 2
    assert_select "tr>td", :text => "Address 2".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => "Zip Code".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Addressable Type".to_s, :count => 2
  end
end
