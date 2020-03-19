Rails.application.routes.draw do
  get '/', to: 'welcome#index'
  # shelters
  get '/shelters', to: 'shelters#index'
  get '/shelters/new', to: 'shelters#new'
  post '/shelters', to: 'shelters#create'
  get '/shelters/:id', to: 'shelters#show'
  get '/shelters/:id/edit', to: 'shelters#edit'
  patch '/shelters/:id', to: 'shelters#update'
  delete '/shelters/:id', to: 'shelters#destroy'
  get '/shelters/:id/pets', to: 'shelters#index_pets'
  # pets
  get '/pets', to: 'pets#index'
  post '/pets', to: 'pets#create'
  get '/pets/:id', to: 'pets#show'
end
