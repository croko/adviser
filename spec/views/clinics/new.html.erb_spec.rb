require 'spec_helper'

describe "clinics/new" do
  before(:each) do
    assign(:clinic, stub_model(Clinic,
      :name => "MyString",
      :description => "MyText",
      :status => "MyString",
      :user_id => 1,
      :published => false,
      :reviews_count => 1,
      :rating => 1.5,
      :likes_count => 1
    ).as_new_record)
  end

  it "renders new clinic form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", clinics_path, "post" do
      assert_select "input#clinic_name[name=?]", "clinic[name]"
      assert_select "textarea#clinic_description[name=?]", "clinic[description]"
      assert_select "input#clinic_status[name=?]", "clinic[status]"
      assert_select "input#clinic_user_id[name=?]", "clinic[user_id]"
      assert_select "input#clinic_published[name=?]", "clinic[published]"
      assert_select "input#clinic_reviews_count[name=?]", "clinic[reviews_count]"
      assert_select "input#clinic_rating[name=?]", "clinic[rating]"
      assert_select "input#clinic_likes_count[name=?]", "clinic[likes_count]"
    end
  end
end
