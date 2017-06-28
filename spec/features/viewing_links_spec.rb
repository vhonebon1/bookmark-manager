feature 'Viewing links' do

  scenario 'I can see existing links on the links page' do
    Link.create(url: 'http://www.google.com/', title: 'Google')

    visit '/links'
    expect(page.status_code).to eq 200

    within 'ul#links' do
      expect(page).to have_content('Google')
    end
  end

    scenario  'I can see links with a certain tag' do
      link = Link.new(url: 'www.myspace.com', title: 'Myspace')
      tag = Tag.first_or_create(name: 'social')
      link.tags << tag
      link.save
      link = Link.new(url: 'www.facebook.com', title: 'Facebook')
      tag = Tag.first_or_create(name: 'bubble')
      link.tags << tag
      link.save
      visit '/tags/bubbles'
      expect(page).not_to have_content('myspace')
    end
end
