class Admin::DishesController < AdminController
		
  before_filter :get_dish, :only => [:show, :edit, :update, :destroy, :visibility]
  before_filter :get_dishes, :only => [:index, :visibility]
  before_filter :get_categories, :only => [:new, :edit, :update]
  respond_to :html, :xml, :json, :js
  helper_method :sort_column, :sort_direction

  def index
  	respond_with(@dishes)  	
  end
  
  def show
  	respond_with(@dish)   
  end

  def new  
    @dish = Dish.new :category_id => params[:category_id]    
    respond_with(@dish)    
  end
  
  def edit 
  	respond_with(@dish)  
  end

  def create
  	@dish = Dish.new(params[:dish])
  	if @dish.save  	 
  	  respond_with([:admin, @dish], :notice => "Successfully created dish.")
  	else
      render :action => 'new'
    end     		     
  end

  def update 	
    if @dish.update_attributes(params[:dish])
      flash[:notice] = "Successfully updated dish."  
    end
    respond_with([:admin, @dish])    
  end 
    
  def visibility    
    @dish.visible == true ? @dish.visible = false : @dish.visible = true
    @dish.update_attributes(params[:dish])
    
    # if @dish.update_attributes(params[:dish])
    #   flash[:notice] = "Successfully updated dish."                              
    # end
    respond_with([:admin, @dish])    
  end
  
  def destroy    
    @dish.destroy    
    flash[:notice] = "Successfully destroyed dish."
    respond_with([:admin, @dish])    
  end
  
  private 
    def get_dish
      @dish = Dish.find(params[:id])
    end
    
    def get_dishes
      @dishes = Dish.order(sort_column + " " + sort_direction) 
    end  
  
    def get_categories
      @categories = Category.order('name')
    end  
  
    def sort_column
      Dish.column_names.include?(params[:sort]) ? params[:sort] : "name"
    end
  
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
  
end



