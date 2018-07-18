Rails.application.routes.draw do
  get 'comments/new'

  get 'comments/create'

  get 'comments/edit'

  get 'comments/destroy'

  get 'comments/show'

  resources :users, only:[:new, :create]
  resource :session, only:[:new, :create, :destroy]
  
  resources :subs, except: :destroy
  resources :posts, except: :index
end
