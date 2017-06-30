feature "Creating a user" do
  scenario 'I can create a new user account' do
    expect { new_user }.to change(User, :count).by 1
    expect(page).to have_content "Welcome, kitty@example.com!"
    expect(User.first.email).to eq 'kitty@example.com'
  end
end
