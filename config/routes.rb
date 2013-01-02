PodcastSyncer::Application.routes.draw do
  post '/accounts' => 'accounts#create'
  get '/accounts/:id' => 'accounts#show'

  get '/accounts/:account_id/podcasts/:id' => 'podcasts#show'
  get '/podcasts/:id' => 'podcasts#show'

  post '/accounts/:account_id/podcasts' => 'podcasts#create'
end
