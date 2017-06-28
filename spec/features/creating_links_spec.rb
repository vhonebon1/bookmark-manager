feature 'creating links' do

  scenario 'I can add a new link to the database' do

    visit '/links/new'
    fill_in 'title', with: 'Facebook'
    fill_in 'url', with: 'http://www.google.com/'
    click_button 'Add bookmark'

    expect(current_path).to eq '/links'

    within 'ul#links' do
      expect(page).to have_content('Facebook')
    end
  end

  scenario 'I can add a tag to a new link' do
    visit '/links/new'
    fill_in 'title', with: 'Facebook'
    fill_in 'url', with: 'http://www.google.com/'
    fill_in 'name', with: 'social'
    click_button 'Add bookmark'
    link = Link.first
    expect(link.tags.map(&:name)).to include('social')
    end

end
