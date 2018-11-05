Rails.application.routes.draw do
  root 'demos#home'
  get 'login', to: 'demos#login'
  get 'success', to: 'demos#success'
  resources :demos
  resources :messages
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
