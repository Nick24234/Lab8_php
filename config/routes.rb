Rails.application.routes.draw do
  scope '(:locale)', locale: /uk|en/ do
    devise_for :users
    get 'static_pages/landing_page'
    get 'static_pages/dashboard'
    root 'static_pages#landing_page'
    # Статичні сторінки
    get 'about', to: 'pages#about'
    get 'support', to: 'pages#support'
    post 'support', to: 'pages#support_result'
    
    resources :users do
      collection do
        get 'registration_params', to: 'users#registration_params'
      end
    end
    
    resources :transfers do
      member do
        patch :complete
        patch :cancel
      end
    end
  end
end
