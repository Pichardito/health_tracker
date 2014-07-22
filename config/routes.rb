Rails.application.routes.draw do

  resources :records
  resources :patients
  devise_for :doctors


  get '/list-of-patients' => 'doctor_welcome#index', as: 'doctor_root'
  get '/getting-visualization/:patient_id' => 'records#d3_data' 
  

  root to: 'welcome#index'


  resources :patients do 
    resources :records 
  end
end
