require 'spec_helper'

describe "registrations/show" do
  before(:each) do
    @advise = assign(:advise, stub_model(Advise,
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
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(/Last Name/)
    rendered.should match(/Name/)
    rendered.should match(/Full Name/)
    rendered.should match(/Specialty/)
    rendered.should match(/City/)
    rendered.should match(/Phone Number/)
    rendered.should match(/Description/)
    rendered.should match(/Status/)
  end
end
