def new_user
  visit ('/users/new')
  fill_in 'email',   with: 'kitty@example.com'
  fill_in 'password', with: 'Mypassword'
  click_button 'Create account'
end
