require 'spec_helper'

describe "clinics/edit" do
  before(:each) do
    @clinic = assign(:clinic, stub_model(Clinic,
      :name => "MyString",
      :description => "MyText",
      :status => "MyString",
      :user_id => 1,
      :published => false,
      :reviews_count => 1,
      :rating => 1.5,
      :likes_count => 1
    ))
  end

  it "renders the edit clinic form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", clinic_path(@clinic), "post" do
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
