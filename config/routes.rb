CleanUpControllerApp::Application.routes.draw do
  resources :users do
    resources :expenses do
      get 'approve', as: :approve
    end
  end
end
