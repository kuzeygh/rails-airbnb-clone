Rails.application.routes.draw do

  resources :events do
    get 'book', to: "events#book"
  end

  devise_for :users

  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
