require 'spec_helper'

describe "registrations/new" do
  before(:each) do
    assign(:advise, stub_model(Advise,
      :user_id => 1,
      :category_id => 1,
      :last_name => "MyString",
      :name => "MyString",
      :full_name => "MyString",
      :specialty => "MyString",
      :city => "MyString",
      :phone_number => "MyString",
      :description => "MyString",
      :status => "MyString"
    ).as_new_record)
  end

  it "renders new registration form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", registrations_path, "post" do
      assert_select "input#registration_user_id[name=?]", "registration[user_id]"
      assert_select "input#registration_category_id[name=?]", "registration[category_id]"
      assert_select "input#registration_last_name[name=?]", "registration[last_name]"
      assert_select "input#registration_name[name=?]", "registration[name]"
      assert_select "input#registration_full_name[name=?]", "registration[full_name]"
      assert_select "input#registration_specialty[name=?]", "registration[specialty]"
      assert_select "input#registration_city[name=?]", "registration[city]"
      assert_select "input#registration_phone_number[name=?]", "registration[phone_number]"
      assert_select "input#registration_description[name=?]", "registration[description]"
      assert_select "input#registration_status[name=?]", "registration[status]"
    end
  end
end
