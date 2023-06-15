Rails.application.routes.draw do
  
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }, path: '', 
path_names: {sign_in: 'login', sign_out: 'logout', sign_up: 'register'}
resources :questions do
  resources :answers, only: [:new, :create, :destroy]
end
resources :products
resources :products, only: [:new] do
  resources :reviews, only: [:create, :destroy]
end


resources :products do
  resources :reviews, only: [:new, :create]
end

delete '/reviews/:id', to: 'reviews#destroy', as: 'eliminar_review'


resources :products, only: [:index, :show] do
  get 'filter_by_category/:category', action: :filter_by_category, on: :collection
end

resources :products, only: [:index, :new, :create, :edit, :update, :destroy]
root to: 'render#index'
patch '/products/:id', to: 'products#update'
get 'render/index'


resources :products do
  resources :solicitudes, only: [:create]
end



resources :solicitudes, only: [:new, :create, :index]
delete 'solicitudes/:id', to: 'solicitudes#destroy', as: 'eliminar_solicitud'
patch 'solicitudes/:id/aceptar', to: 'solicitudes#aceptar', as: 'aceptar_solicitud'
patch 'solicitudes/:id/rechazar', to: 'solicitudes#rechazar', as: 'rechazar_solicitud' 
get 'solicitudes/aceptadas_rechazadas', to: 'solicitudes#aceptadas_rechazadas', as: 'solicitudes_aceptadas_rechazadas'
get 'solicitudes/pendientes', to: 'solicitudes#pendientes', as: 'solicitudes_pendientes'
get 'solicitudes/buscar', to: 'solicitudes#buscar', as: 'solicitudes_buscar'



end




