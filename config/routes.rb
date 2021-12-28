Rails.application.routes.draw do
  resources :questions
  resources :exercices
  resources :classrooms
  get 'dashboard/index'
  resources :courses
  resources :schools
  resources :materials
  resources :levels
  root to:'welcome#index'
  #get "resultats", to:'results#new'
  get "feeds", to:'home#index'
  #get 'enrollments/create'
  #get 'enrollments/destroy'
  #get "classrooms", to:"classrooms#index"
  get "espace_enseignant", to:'dashboard#index'
  get "teams", to:'home#show'
  get "inscription-enseignant", to:'home#enseignant'
  get "lesson", to:'courses#new'
  

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
