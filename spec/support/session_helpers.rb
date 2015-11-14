module Features
  # Helpers for registering and logging users in
  module SessionHelpers
    def fill_in_registration_form
      fill_in 'Email',                 with: 'rosa@example.com'
      fill_in 'Password',              with: 'foobarbat'
      fill_in 'Password confirmation', with: 'foobarbat'
    end

    def register_user(data)
      email, password = data[:email], data[:password]
      visit new_user_registration_path
      fill_in 'Email',                 with: email
      fill_in 'Password',              with: password
      fill_in 'Password confirmation', with: password
      click_button 'Sign up'
    end

    def login(email, password)
      visit new_user_session_path
      fill_in 'Email', with: email
      fill_in 'Password', with: password
      click_button 'Log in'
    end

    def password_reset
      click_link 'Forgot your password?'
      fill_in 'Email',            with: 'j.smith@example.com'
      click_button 'Send me reset password instructions'
      open_email('j.smith@example.com')
    end
  end
end
