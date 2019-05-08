Rails.application.routes.draw do
  get '/:link_id', to: 'link_uses#index', constraints: { link_id: /\w+\+/ }
  get '/:id', to: 'links#show', as: :link
  resources :links, only: [:create] do
    resources :uses, controller: 'link_uses', only: [:index]
  end
end
