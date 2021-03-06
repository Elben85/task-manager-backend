Rails.application.routes.draw do
  scope '/api' do 
    resources :task
    resources :users do
      collection do
        post 'login'
        post 'signup' 
      end 
    end
    resources :tokens do
      collection do
        post 'me'
        post 'auth'
      end
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
