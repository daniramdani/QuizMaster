Rails.application.routes.draw do

  resources :questions
  resources :answer_questions, only: [:index]
  post 'answer', to: 'questions#answer'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
end
