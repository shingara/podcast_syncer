PodcastSyncer.controller do
  post '/account' do
    @account = Account.create
    if @account
      status 201
      render 'account/show'
    else
      status 400
    end
  end
end
