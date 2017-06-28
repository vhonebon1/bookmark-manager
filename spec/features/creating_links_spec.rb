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
    expect { find_field('tag') }.to_not raise_error
  end

  scenario 'I can add a tag to a new link' do
    visit '/links/new'
    fill_in 'title', with: 'Facebook'
    fill_in 'url', with: 'http://www.google.com/'
    fill_in 'tag', with: 'social'
    click_button 'Add bookmark'

    expect(current_path).to eq '/links'

    within 'ul#links' do
      expect(page).to have_content('Tag/s: social')
    end
  end

end
