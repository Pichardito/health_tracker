Rails.application.routes.draw do

  resources :records
  resources :patients
  devise_for :doctors


  get '/list-of-patients' => 'doctor_welcome#index', as: 'doctor_root'

  root to: 'welcome#index'


  resources :patients do 
    resources :records 
  end
end
