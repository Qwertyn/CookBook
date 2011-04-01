require 'spec_helper'

describe "LayoutLinks" do
  
  it "should have the right links on the layout" do
    visit root_path
    click_link "About"
    response.should have_selector('title', :content => "About")
  end
  
  
  # it "should have a Home page at '/'" do
  #   get '/'
  #   response.should have_selector('title', :content => "Home")
  # end
  #   
  # it "should have an About page at '/about'" do
  #   get '/about'
  #   response.should have_selector('title', :content => "About")
  # end
  # 
  # describe "GET /layout_links" do
  #   it "works! (now write some real specs)" do
  #     # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
  #     get layout_links_index_path
  #     response.status.should be(200)
  #   end
  # end
end
