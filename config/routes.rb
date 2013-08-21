Rails.application.routes.draw do
  
  resources :notifications, :only => :index
  
end
