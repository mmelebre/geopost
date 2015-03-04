Rails.application.routes.draw do

  root "posts#index"
  resources :posts do

  	resources :comments

  end	

  
  
  # the resources :post above generates 7 other roots as below:
  # POST   /posts(.:format)          posts#create
 # new_post GET    /posts/new(.:format)      posts#new
# edit_post GET    /posts/:id/edit(.:format) posts#edit
     # post GET    /posts/:id(.:format)      posts#show
          # PATCH  /posts/:id(.:format)      posts#update
          # PUT    /posts/:id(.:format)      posts#update
          # DELETE /posts/:id(.:format)      posts#destroy
end
