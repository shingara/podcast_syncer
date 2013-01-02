class Item

  include Mongoid::Document

  field :link, :type => String
  field :title, :type => String
  field :guid, :type => String
  field :published_at, :type => DateTime
  field :author, :type => String
  field :description, :type => String

  embedded_in :podcasts
end
