Mendian::Application.routes.draw do



  get "searches/create"

  resources :categories
  resources :users
  resources :posts do
  	resource :like
    resources :user_comments, path: "comments"
  end



  # Single resource
  resource :session
  resource :account
  resource :search


  root to: "posts#index"

  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

end
