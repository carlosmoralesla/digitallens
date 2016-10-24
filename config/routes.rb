Rails.application.routes.draw do
  
  resources :accesory_sales
  namespace :api do
    resources :clients
  end
  ##################################
  resources :lent_accesories do
    match 'search', :via => [:post,:get], :on => :collection
  end

  resources :lent_kinds do
    match 'search', :via => [:post,:get], :on => :collection
  end

  resources :info_sales do
    match 'search', :via => [:post,:get], :on => :collection
  end

  resources :sales do 
    match 'search', :via => [:post,:get], :on => :collection
    match 'search_client',:via =>[:get], :on => :collection   
  end  

  resources :lent_types do
    match 'search', :via => [:post,:get], :on => :collection
  end

  resources :history_clients do
    match 'search', :via => [:post,:get], :on => :collection
  end

  resources :monture_types do
    match 'search', :via => [:post,:get], :on => :collection
  end

  resources :lent_models do
    match 'search', :via => [:post,:get], :on => :collection
  end

  resources :lent_marks do
    match 'search', :via => [:post,:get], :on => :collection
  end

  resources :lent_colors do
    match 'search', :via => [:post,:get], :on => :collection
  end
  
  resources :lent_serials do
    match 'search', :via => [:post,:get], :on => :collection
    match 'find_type_model',:via =>[:get], :on => :collection      
  end

  resources :suppliers do
    match 'search', :via => [:post,:get], :on => :collection
    match 'find_type_doc',:via =>[:get], :on => :collection  
  end

  resources :clients do
    match 'search', :via => [:post,:get], :on => :collection
    match 'find_type_doc',:via =>[:get], :on => :collection      
    resources :history_clients    
  end
 

  resources :type_clients do
     match 'search', :via => [:post,:get], :on => :collection
  end

  resources :type_docs do
     match 'search', :via => [:post,:get], :on => :collection
  end

  resources :accounts do
     match 'search', :via => [:post,:get], :on => :collection
  end
  
  resources :dashboards

  devise_for :users,controllers: {sessions: 'sessions'}
  
  resources :users

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'home#index'  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
