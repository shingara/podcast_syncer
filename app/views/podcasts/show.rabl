object @podcast
attribute :url

code(:id) do |pod|
  pod.id.to_s
end

node :links do |obj|
  {
    'self' => "/podcasts/#{obj.id}"
  }
end
