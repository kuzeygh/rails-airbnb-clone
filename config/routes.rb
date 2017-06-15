Rails.application.routes.draw do

  root to: 'pages#home'

  resources :events do
    get 'book', to: "events#book"
  end

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
