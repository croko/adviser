require 'spec_helper'

describe "admin_users/new" do
  before(:each) do
    assign(:admin_user, stub_model(AdminUser).as_new_record)
  end

  it "renders new admin_user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", admin_users_path, "post" do
    end
  end
end
