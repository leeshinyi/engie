Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/', to: 'application#health_check'

  scope :api, module: 'api' do
    namespace :v1 do
      resources :users, only: %i[index show]
    end
  end
end
