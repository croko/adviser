require 'spec_helper'

describe LikesController do

  describe "GET 'create'" do
    it "returns http success" do
      get 'create'
      response.should be_success
    end
  end

end
