object @account
attribute :id
node :links do |obj|
  {
    'self' => "/accounts/#{obj.id}"
  }
end
