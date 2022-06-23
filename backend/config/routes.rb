Rails.application.routes.draw do
  scope 'game' do
    get 'new_game', to: 'game#new_game'
    get 'draw_card', to: 'game#draw_card'
    get 'played_cards', to: 'game#played_cards'
  end
  scope 'api/v1' do
    resources :events
    resources :categories
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
