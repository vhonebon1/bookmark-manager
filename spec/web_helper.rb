def new_user
  visit ('/users/new')
  fill_in 'email',   with: 'vhonebon@gmail.com'
  fill_in 'password', with: 'Mypassword'
  click_button 'Create account'
end
