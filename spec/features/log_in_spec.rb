require 'rails_helper'

feature 'User logs in' do
  scenario 'with valid credentials' do
    register_user(email: 'smith@example.com', password: 'password')
    click_link 'Sign out'
    login 'smith@example.com', 'password'
    expect(page).to have_content 'Signed in successfully.'
  end

  scenario 'with unknown email' do
    login 'smith123@example.com', 'password'
    expect(page).to have_content 'Invalid email or password.'
  end

  scenario 'with invalid password' do
    login 'smith@example.com', 'banana'
    expect(page).to have_content 'Invalid email or password'
  end
end
