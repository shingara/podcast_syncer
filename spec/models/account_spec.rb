require 'spec_helper'

describe Account do
  it { should have_field(:_id) }
  its(:collection_name) { should eq :accounts }
end
