feature 'Viewing links' do

  scenario 'I can see existing links on the links page' do
    Link.create(url: 'http://www.google.com/', title: 'Google')

    visit '/links'
    expect(page.status_code).to eq 200

    within 'ul#links' do
      expect(page).to have_content('Google')
    end
  end

    before(:each) do
      Link.create(url: 'http://www.facebook.com', title: 'Facebook', tags: [Tag.first_or_create(name: 'social')])
      Link.create(url: 'http://www.bubblesrus.com', title: 'Bubblesrus', tags: [Tag.first_or_create(name: 'bubbles')])
    end

    scenario 'I can filter links by tag' do
      visit '/tags/bubbles'
    within 'ul#links' do
      expect(page).not_to have_content('Facebook')
      expect(page).to have_content('Bubblesrus')
    end
  end
end
