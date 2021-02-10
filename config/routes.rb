Rails.application.routes.draw do
  get 'emps/show'
  resources :challenges do
    resources :votes, only: [:create, :destroy], shallow: true
    resources :collaborations, only: [:create, :destroy], shallow: true
  end
  devise_for :emps
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "challenges#index"
  
end
