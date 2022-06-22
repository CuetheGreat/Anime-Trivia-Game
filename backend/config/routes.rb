Rails.application.routes.draw do
  scope 'api/v1' do
    resources :events
    resources :categories
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
