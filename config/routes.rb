PodcastSyncer::Application.routes.draw do
  post '/accounts' => 'accounts#create'
end
