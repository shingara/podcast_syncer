describe "accounts/show" do
  let(:account) {
    stub(:id => 12)
  }
  before do
    @rendered = Rabl.render(
      account,
      'accounts/show', {
        :view_path => 'app/views'
      }
    )
  end

  it 'should have one items' do
    @rendered.should eq(
      {
        'id' => 12,
        'links' => {
          'self' => '/accounts/12'
        },
      }.to_json
    )
  end
end
