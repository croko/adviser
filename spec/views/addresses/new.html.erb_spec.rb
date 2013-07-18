require 'spec_helper'

describe "addresses/new" do
  before(:each) do
    assign(:address, stub_model(Address,
      :phone_number => "MyString",
      :mobile_phone_number => "MyString",
      :address_1 => "MyString",
      :address_2 => "MyString",
      :city => "MyString",
      :state => "MyString",
      :zip_code => "MyString",
      :addressable_id => 1,
      :addressable_type => "MyString"
    ).as_new_record)
  end

  it "renders new address form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", addresses_path, "post" do
      assert_select "input#address_phone_number[name=?]", "address[phone_number]"
      assert_select "input#address_mobile_phone_number[name=?]", "address[mobile_phone_number]"
      assert_select "input#address_address_1[name=?]", "address[address_1]"
      assert_select "input#address_address_2[name=?]", "address[address_2]"
      assert_select "input#address_city[name=?]", "address[city]"
      assert_select "input#address_state[name=?]", "address[state]"
      assert_select "input#address_zip_code[name=?]", "address[zip_code]"
      assert_select "input#address_addressable_id[name=?]", "address[addressable_id]"
      assert_select "input#address_addressable_type[name=?]", "address[addressable_type]"
    end
  end
end
