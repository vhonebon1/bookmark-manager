feature 'Creating tags' do
  scenario 'I can add multiple tags to a new link' do
    visit '/links/new'
    fill_in 'url',   with: 'http://www.cutecats.com/'
    fill_in 'title', with: 'Cute cats'
    fill_in 'name',  with: 'cats yay!'
    click_button 'Add bookmark'
    link = Link.first
    expect(link.tags.map(&:name)).to include('cats', 'yay!')
  end
end
