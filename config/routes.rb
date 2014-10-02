CleanUpControllerApp::Application.routes.draw do
  resources :users do
    resources :expenses
    resources :approved_expenses, only: [:update]
  end
end
