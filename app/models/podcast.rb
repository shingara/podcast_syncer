class Podcast
  include Mongoid::Document
  store_in :collection => 'podcasts'

  field :url, :type => String

  embeds_many :items
end
