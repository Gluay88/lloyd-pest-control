Rails.application.routes.draw do
  get 'welcome/index'
  get 'welcome/technicians'
  get 'welcome/locations'
  get 'welcome/orders'
  resources :invoices
  root to: 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
