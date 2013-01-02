require 'spec_helper'

describe Podcast do

  it { should have_field(:url).of_type(String) }
  it { should embed_many(:items).of_type(Item) }
  its(:collection_name) { should eq :podcasts }

end
