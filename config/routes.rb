Rails.application.routes.draw do
  get 'push_copies_charts/index'

  get 'push_deeps_charts/index'

  get 'push_types_charts/index'

  get 'daily_pushtime_distributions_charts/index'

  get 'daily_pushes_charts/index'

  get 'daily_pushes_chart/index'

  get 'charts_navi/index'

  get 'figures_navi/index'

  root 'application#welcome'

  get 'skips/index'
  get 'data_charge/index'
  get 'data_static/index'

  resources :competitors
  resources :push_types

  resources :pushes do
    collection do
      get 'home'
      get 'upload'
      post 'upload'
      get 'navi_menu'
    end
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
