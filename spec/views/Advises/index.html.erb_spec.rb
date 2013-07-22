require 'spec_helper'

describe "registrations/index" do
  before(:each) do
    assign(:Advises, [
      stub_model(Advise,
        :user_id => 1,
        :category_id => 2,
        :last_name => "Last Name",
        :name => "Name",
        :full_name => "Full Name",
        :specialty => "Specialty",
        :city => "City",
        :phone_number => "Phone Number",
        :description => "Description",
        :status => "Status"
      ),
      stub_model(Advise,
        :user_id => 1,
        :category_id => 2,
        :last_name => "Last Name",
        :name => "Name",
        :full_name => "Full Name",
        :specialty => "Specialty",
        :city => "City",
        :phone_number => "Phone Number",
        :description => "Description",
        :status => "Status"
      )
    ])
  end

  it "renders a list of registrations" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Full Name".to_s, :count => 2
    assert_select "tr>td", :text => "Specialty".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "Phone Number".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
  end
end
