Rails.application.routes.draw do
  devise_for :users

  root to: 'financial_report#dashboard'
  get 'dashboard', to: 'financial_report#dashboard'

  resources :cash_flows, only: %i[new create update destroy]
  resources :investments, only: %i[new create update destroy]
  resources :stock_investments, only: %i[new create update destroy]
end
