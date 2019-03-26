Rails.application.routes.draw do
  resources :invoices do
    resources :products
  end

  resources :sales do
    resources :invoices
  end

  resources :clients do
    resources :sales
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
