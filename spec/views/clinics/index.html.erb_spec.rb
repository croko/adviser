require 'spec_helper'

describe "clinics/index" do
  before(:each) do
    assign(:clinics, [
      stub_model(Clinic,
        :name => "Name",
        :description => "MyText",
        :status => "Status",
        :user_id => 1,
        :published => false,
        :reviews_count => 2,
        :rating => 1.5,
        :likes_count => 3
      ),
      stub_model(Clinic,
        :name => "Name",
        :description => "MyText",
        :status => "Status",
        :user_id => 1,
        :published => false,
        :reviews_count => 2,
        :rating => 1.5,
        :likes_count => 3
      )
    ])
  end

  it "renders a list of clinics" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
  end
end
