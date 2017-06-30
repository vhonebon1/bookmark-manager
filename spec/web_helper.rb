def new_user(email: 'kitty@example.com',
             password: 'Mypassword',
             password_confirmation: 'Mypassword')
  visit ('/users/new')
  fill_in 'email',   with: email
  fill_in 'password', with: password
  fill_in 'password confirmation', with: password_confirmation
  click_button 'Create account'
end
