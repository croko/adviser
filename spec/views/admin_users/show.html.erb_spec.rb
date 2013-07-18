require 'spec_helper'

describe "admin_users/show" do
  before(:each) do
    @admin_user = assign(:admin_user, stub_model(AdminUser))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
