# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :members, controllers: {
    sessions: 'members/sessions',
    registrations: 'members/registrations'
  }

  devise_for :admins, skip: :all
  devise_scope :admin do
    get 'admins/sign_in' => 'admins/sessions#new', as: 'new_admin_session'
    post 'admins/sign_in' => 'admins/sessions#create', as: 'admin_session'
    delete 'admins/sign_out' => 'admins/sessions#destroy', as: 'destroy_admin_session'
  end
  namespace :admins do
    resources :genres, except: [:show]
  end

  root to: 'sites#top'

  scope module: :members do
    resources :inquiries, only: %i[new create]
    resources :words do
      resource :likes, only: %i[destroy create]
    end
    resources :members, except: %i[index new destroy]
    get '/search' => 'searchs#search'
  end

  get 'members/genres/:id', to: 'members/genres#show', as: 'members_genres'
end


