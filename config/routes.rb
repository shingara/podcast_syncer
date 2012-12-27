PodcastSyncer::Application.routes.draw do
  post '/accounts' => 'accounts#create'
  get '/accounts/:id' => 'accounts#show'
end
