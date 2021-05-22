Rails.application.routes.draw do


  devise_for :members, controllers: {
    sessions:      'members/sessions',
    passwords:     'members/passwords',
    registrations: 'members/registrations'
  }

  devise_for :admins, skip: :all
    devise_scope :admin do
    get 'admins/sign_in' => 'admins/sessions#new', as: 'new_admin_session'
    post 'admins/sign_in' => 'admins/sessions#create', as: 'admin_session'
    delete 'admins/sign_out' => 'admins/sessions#destroy', as: 'destroy_admin_session'
  end
    scope module: :admins do
    resources :genres
    end

  root to: 'sites#top'

  scope module: :members do
    resources :inquiries, only: [:new, :create]
    resources :words do
      resource :likes, only: [:destroy, :create]
    end
    resources :members, except: [:index, :new, :destroy]
    get '/search' => 'searchs#search'
  end

end
