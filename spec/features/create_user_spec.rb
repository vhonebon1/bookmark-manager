feature "Creating a user" do
  scenario 'I can create a new user account' do
    new_user
    expect(page).to have_content "Welcome!"
    expect(page).to have_content "vhonebon@gmail.com"
    expect(User.first.count).to eq 1
  end
end
