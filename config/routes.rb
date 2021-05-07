Rails.application.routes.draw do
  
  root to: 'members/words#index'
  
  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }
  
  devise_for :members, controllers: {
    sessions:      'members/sessions',
    passwords:     'members/passwords',
    registrations: 'members/registrations'
  }
  
  namespace :admins do
    resources :genres, except: [:destroy]
  end

  scope module: :members do
    resources :words do
      resource :likes, only: [:destroy, :create]
    end
    resources :members, except: [:index, :new, :destroy]
  end
  
  #devise_for :users, controllers: {sessions: 'users/sessions'}
  
end
