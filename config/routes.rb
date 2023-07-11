Rails.application.routes.draw do
  resources :registries
  resources :participants
  resources :enrollments
  resources :coordinators do
    member do
      get :export_participants
    end
  end
end
