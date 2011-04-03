class Admin::CategoriesController < AdminController
	
  before_filter :get_category, :only => [:edit, :update, :destroy]
  before_filter :get_categories, :only => [:index]
  respond_to :html, :xml, :json
  helper_method :sort_column, :sort_direction

  def index  	
  	respond_with(@categories)  	
  end
  
  def new    
    respond_with(@category = Category.new )    
  end
  
  def edit 
  	respond_with(@category)  
  end

  def create
  	@category = Category.new(params[:category])
  	if @category.save
  	  flash[:notice] = "Successfully created category."
  	  redirect_to admin_categories_path
  	else
      render :action => 'new'
    end     		     
  end

  def update 	
    if @category.update_attributes(params[:category])
      flash[:notice] = "Successfully updated category."
      redirect_to admin_categories_path
    else    
      render :action => 'edit'
    end
  end 
    
  def destroy    
    @category.destroy    
    flash[:notice] = "Successfully destroyed category."    
    respond_with([:admin, @category])    
  end
  
  private 
    def get_category
      @category = Category.find(params[:id], :include => :dishes)
    end
    
    def get_categories      
      @categories = Category.order(sort_column + " " + sort_direction)
    end  
  
    def sort_column
      Category.column_names.include?(params[:sort]) ? params[:sort] : "name"
    end
      
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
       
end
