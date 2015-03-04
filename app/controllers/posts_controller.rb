class PostsController < ApplicationController

# use the pre-defined method before_action below to use the method find_post defined at the bottom of the file across the file

# we use ':' before the name of the method below because that's the way  the method before_action works, like the method render used further down. But it cannot be generalised.
before_action :find_post, except: [:index, :new, :create]
  # def defines any method (or action in ruby), e.g. the def index end defines a new action index which is defined by the code between def index and end
  def index
    # ActiveRecord gives us queries like Post.all. See app/models/post.rb
    
    if params[:featured].present? and params[:featured] == "true"
      # GET all the posts from the posts table in the DB
  	 @posts = Post.where(is_featured: true).order("created_at DESC")
    else
      # .order("created_at DESC") allows the posts be shown from the latest posted post
     @posts = Post.order("created_at DESC")
    end

    if params[:published].present? and params[:published] == "true"
     @posts = Post.where(is_published: true).order("created_at DESC")
    else
     @posts = Post.order("created_at DESC")
    end

   

  end

  def show
    # GET post with the id from the URL

  	# @post = Post.find(params[:id])
    @comments = @post.comments


  end	

  def new
# The new form gets submitted to the create action
    @post = Post.new
  
  end

  def create
    @post = Post.new(post_params) #we populate the empty row with whatever comes from the methods (or actions) post_params which is defined at the bottom of this file 


    if @post.save
      flash[:success] = "Thanks for posting!"
      redirect_to root_path
    else 
      flash[:error] = "Oops, something went wrong! Please try again."
      render :new
    end 

  end	
  	
  def edit
# The edit form gets submitted to the update action

    # @post = Post.find(params[:id])
  
  end	
  
  def update

    # @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:success] = "Updated! \"#{@post.title}\"."

      redirect_to post_path(@post)
    else
      flash[:error] = "Try again!"
      render :edit
    end  
  end	

  def destroy

    # @post = Post.find(params[:id])
    @post.destroy
    redirect_to root_path
  end	
  
  	# private allows us to define methods (or actions) that are valid only within this file 
  private #private doesn;t need end

    def post_params
      # allow attributes that I trust, ignore any scary malicious unsation evil data

      params.require(:post).permit(:title, :body, :is_published, :is_featured)
    end  

    # To avoid repeating @post = Post.find(params[:id]) on several lines above we define the method below
  def find_post
    @post = Post.find(params[:id])
  end     
   
  			
end
