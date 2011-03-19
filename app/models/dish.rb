class Dish < ActiveRecord::Base
  validates :name, :presence => true, :uniqueness => true
  validates :recipe, :presence => true
  
  belongs_to :category
   
end
