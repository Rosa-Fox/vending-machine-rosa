require 'rails_helper'

feature 'User signs up' do
  scenario 'with valid data' do
    visit new_user_registration_path
    fill_in_registration_form
    click_button 'Sign up'
    expect(page).to have_content 'Welcome! You have signed up successfully.'
  end

  scenario 'with mismatched password and password confirmation' do
    visit new_user_registration_path
    fill_in_registration_form
    fill_in 'Password confirmation', with: 'barbatfoo'
    click_button 'Sign up'
    expect(page).to have_content "Password confirmation doesn't match Password"
  end

  scenario 'with a blank password' do
    visit new_user_registration_path
    fill_in_registration_form
    fill_in 'Password',              with: ''
    fill_in 'Password confirmation', with: ''

    click_button 'Sign up'
    expect(page).to have_content "Password can't be blank"
  end

  scenario 'with a duplicate email address' do
    visit new_user_registration_path
    fill_in_registration_form
    fill_in 'Email', with: 'myemail@example.com'
    click_button 'Sign up'
    click_link 'Sign out'
    expect(page).to have_content 'You need to sign in or sign up before continuing.'
    visit new_user_registration_path
    fill_in_registration_form
    fill_in 'Email', with: 'myemail@example.com'
    click_button 'Sign up'
    expect(page).to have_content 'Email has already been taken'
  end
end
