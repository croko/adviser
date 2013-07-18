require 'spec_helper'

describe "addresses/show" do
  before(:each) do
    @address = assign(:address, stub_model(Address,
      :phone_number => "Phone Number",
      :mobile_phone_number => "Mobile Phone Number",
      :address_1 => "Address 1",
      :address_2 => "Address 2",
      :city => "City",
      :state => "State",
      :zip_code => "Zip Code",
      :addressable_id => 1,
      :addressable_type => "Addressable Type"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Phone Number/)
    rendered.should match(/Mobile Phone Number/)
    rendered.should match(/Address 1/)
    rendered.should match(/Address 2/)
    rendered.should match(/City/)
    rendered.should match(/State/)
    rendered.should match(/Zip Code/)
    rendered.should match(/1/)
    rendered.should match(/Addressable Type/)
  end
end
