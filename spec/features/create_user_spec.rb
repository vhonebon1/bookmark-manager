feature "Creating a user" do
  scenario 'I can create a new user account' do
    expect { new_user }.to change(User, :count).by 1
    expect(page).to have_content "Welcome, kitty@example.com!"
    expect(User.first.email).to eq 'kitty@example.com'
  end

  scenario 'Checks whether the two passwords enetered are the same' do
    expect { new_user(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(page).to have_content("Password and confirmation password do not match")
  end
end
