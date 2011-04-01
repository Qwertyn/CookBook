module ApplicationHelper
      
  def title
    base_title = "CookBook"
    @title.blank? ? base_title : "#{base_title} | #{@title}"    
  end
  
end
