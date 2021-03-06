Rails.application.routes.draw do
  
  get 'dashboard/index'
  root to:'welcome#index'
  get "resultats", to:'results#new'
  get "feeds", to:'home#index'
  #get 'enrollments/create'
  #get 'enrollments/destroy'
  get "classrooms", to:"classrooms#index"
  get "espace_enseignant", to:'dashboard#index'
  get "teams", to:'home#show'
  get "inscription-enseignant", to:'home#enseignant'
  get "lesson", to:'courses#new'
  
  
  resources :courses do
    resources :exercices, only: [:new, :create, :show, :index]
    get "exercices", to:"exercices#index"
  end
  resources :exercices, except: [:new, :show, :edit, :create, :update, :destroy, :index] do
    member do
      delete 'delete', to: 'exercices#destroy'
      post '/publish', to: 'exercices#publish'
    end
    resources :questions, only: [:new, :create, :destroy]
    resources :results, only: [:new, :create]
  end

  resources :exercices, :classrooms, :schools, :materials, :levels

  ######### USER DATA #########
  devise_scope :user do
    get 'profile/edit'    => 'devise/registrations#edit',   :as => :edit_user_registration
    get 'profile/cancel'  => 'devise/registrations#cancel', :as => :cancel_user_registration
  end

  devise_for  :users,
              :path => '',
              :path_names => {  :sign_in =>       'connexion',
                                :sign_out =>      'logout',
                                :sign_up =>       '',
                                :registration =>  'inscription',
                                :edit =>          'edit'
                              }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
