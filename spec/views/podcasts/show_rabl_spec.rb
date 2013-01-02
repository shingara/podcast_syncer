require 'spec_helper'

describe "podcasts/show" do
  let(:account) {
    Account.new(:id => 12)
  }

  let(:podcast) {
    Podcast.new(
      :url => 'http://example.org'
    )
  }

  before do
    @rendered = Rabl.render(
      podcast,
      'podcasts/show', {
        :view_path => 'app/views'
      }
    )
  end

  it 'should have one items' do
    @rendered.should eq(
      {
        'url' => podcast.url,
        'id' => podcast.id.to_s,
        'links' => {
          'self' => "/podcasts/#{podcast.id.to_s}"
        },
      }.to_json
    )
  end

end
