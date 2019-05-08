Rails.application.routes.draw do
  resources :links, only: [:create]
  get '/:id', to: 'links#show', as: :link
end
