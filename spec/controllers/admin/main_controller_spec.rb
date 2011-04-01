require 'spec_helper'

describe Admin::MainController do
  render_views
  describe "GET 'index'" do
    it "should be successful" do
      get 'index'
      response.should be_success
    end
    
    it "shold have the right title" do 
      get 'index'
      response.should have_selector("title", :content => "CookBook | Index")
    end
  end

end
