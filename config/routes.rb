Rails.application.routes.draw do
  resources :steps
  resources :phases
  resources :projects
  resources :programs
  devise_for :admins
  devise_for :users, :controllers => { registrations: 'registrations' }

  get '/home' => "pages#userhome", as: :user_root
  get '/admin/home' => "pages#adminhome", as: :admin_root
  get '/user/form' => "pages#userform", as: :user_form

  get '/admin/reporte' => "pages#reporte", as: :admin_report

  get '/user/post' => "pages#avance", as: :user_post

  post "/user/form" => "pages#saveform", :as => :save_form

  post "/user/post" => "pages#savepost", :as => :save_post



  devise_scope :user do
    root to: "devise/sessions#new"
  end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
