require 'spec_helper'

describe "admin_users/index" do
  before(:each) do
    assign(:admin_users, [
      stub_model(AdminUser),
      stub_model(AdminUser)
    ])
  end

  it "renders a list of admin_users" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
