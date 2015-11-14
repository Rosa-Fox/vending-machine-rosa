require 'rails_helper'

feature 'Password reset' do
  let(:password) { 'bananaorange' }
  let(:new_password) { 'orangeorange' }
  let(:password_under_eight_characters) { 'banana' }
  scenario 'user forgets their password' do
    register_user(email: 'j.smith@example.com', password: password)
    click_link 'Sign out'
    password_reset
    expect(current_email).to have_content 'Someone has requested a link to change your password.'
    current_email.click_link 'Change my password'
    fill_in 'Confirm new password', with: new_password
    fill_in 'New password', with: new_password
    click_button 'Change my password'
    expect(page).to have_content 'Your password has been changed successfully. You are now signed in.'
  end

  scenario 'with an unregistered email address' do
    visit new_user_session_path
    click_link 'Forgot your password?'
    fill_in 'Email', with: 'hello@example.com'
    click_button 'Send me reset password instructions'
    expect(page).to have_content 'Email not found'
  end

  scenario 'with mismatched password and password confirmation' do
    register_user(email: 'j.smith@example.com', password: 'bananaorange')
    click_link 'Sign out'
    password_reset
    expect(current_email).to have_content 'Someone has requested a link to change your password.'
    current_email.click_link 'Change my password'
    fill_in 'New password', with: new_password
    fill_in 'Confirm new password', with: password
    click_button 'Change my password'
    expect(page).to have_content "Password confirmation doesn't match Password"
  end

  scenario 'with password under 8 characters' do
    register_user(email: 'j.smith@example.com', password: 'bananaorange')
    click_link 'Sign out'
    password_reset
    expect(current_email).to have_content 'Someone has requested a link to change your password.'
    current_email.click_link 'Change my password'
    fill_in 'New password', with: password_under_eight_characters
    fill_in 'Confirm new password', with: password_under_eight_characters
    click_button 'Change my password'
    expect(page).to have_content 'Password is too short (minimum is 8 characters)'
  end
end
