Rails.application.routes.draw do
  get 'doses/new'
  get 'doses/create'
  get 'doses/delete'
  # get 'cocktail/index'
  # get 'cocktail/show'
  # get 'cocktail/new'
  # get 'cocktail/create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :cocktails, only: [:index, :new, :show, :create] do
    resources :doses, only: [:new, :create]
  end

  resources :doses, only: [:destroy]
end
