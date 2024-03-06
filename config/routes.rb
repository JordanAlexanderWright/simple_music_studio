Rails.application.routes.draw do
  get 'request_payments/index'
  get 'request_payments/new'
  get 'messages/index'
  get 'messages/show'
  devise_for :studio_owners, controllers: {
    sessions: 'studio_owners/sessions'
  }

  # Can add registrations: 'admin/registrations'
  #
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  root 'dashboard#home'

  namespace :users do
    root 'users#dashboard'


  end

  namespace :studio_owners do
    root 'studio_owners#dashboard'
    get 'dashboard', to: 'studio_owners#dashboard'
    resources :student_management, only: [:index]
    resources :request_payments, only: [:index, :new]
    resource :account_management, only: [:edit, :index], controller: 'account_management' do
      post :accept_tos, on: :collection
    end
  end

  post '/create-checkout-session', to:'payments#payment_request' do
    content_type 'application/json'
  end

  get '/payment_success', to:'payments#success'
  get '/payment_failure', to:'payments#failure'




  # get 'users/signup', to: 'users/users#signup'
  post 'send_invitation', to: 'invitations#send_invitation'

  # get 'users/dashboard', to: 'users#dashboard', as: 'users_dashboard'
  # get 'studio_owners/dashboard', to: 'studio_owners#dashboard', as: 'studio_owners_dashboard'

  resources :studios
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
