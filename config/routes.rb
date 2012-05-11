Florarails::Application.routes.draw do

  root :to => "catalogo#index"

  resources :clientes
  resources :produtos
  resources :grupos
  
  
  # não deve haver dois matchs apontando a mesma rota
  # match 'catalogo' => 'catalogo#detalhes'
  # sugestão 

  match 'catalogo' => 'catalogo#index' 
  match 'catalogo/detalhes' => 'catalogo#detalhes'
  match 'catalogo/adicionar_no_carrinho/:id' => 'catalogo#adicionar_no_carrinho'
  match 'catalogo/esvaziar_carrinho' => 'catalogo#esvaziar_carrinho'
  match 'catalogo/remover_do_carrinho/:id' => 'catalogo#remover_do_carrinho'
  match 'catalogo/procurar' => 'catalogo#procurar'
  match 'catalogo/lista_itens_grupo' => 'catalogo#lista_itens_grupo'
  match 'clientes/new' => 'clientes#new'
  match 'pedidos/fechar_pedido' => 'pedidos#fechar_pedido'
  match 'acessos/login' => 'acessos#login'
  match 'acessos/logout' => 'acessos#logout'
  match 'catalogo/salva_pedido' => 'catalogo#salva_pedido'
  
  
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
