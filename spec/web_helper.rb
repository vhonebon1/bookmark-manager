def new_user
  visit ('/users/new')
  fill_in 'email',   with: 'kitty@example.com'
  fill_in 'password', with: 'Mypassword'
  fill_in 'password confirmation', with: 'Mypassword1'
  click_button 'Create account'
end
