Rails.application.routes.draw do
  resources :schedules do 
    collection { post :import }
  end
  resources :work_orders do
    collection { post :import }
  end
  resources :locations do 
    collection { post :import }
  end
  resources :technicians do 
    collection { post :import }
  end
  get 'welcome/index'
  get 'welcome/technicians'
  get 'welcome/locations'
  get 'welcome/orders'
  get 'welcome/schedules'
  resources :invoices
  root to: 'welcome#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
