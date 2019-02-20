Rails.application.routes.draw do
  devise_for :users
  get 'dashboard', to: 'financial_report#dashboard'
end
