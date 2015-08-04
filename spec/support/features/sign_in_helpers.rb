module Features
  module SessionHelpers
    def sign_in_with(data)
      visit root_path
      click_link "Sign in"
      within("#sign-in") do
        fill_in 'Email',    with: data[:email]
        fill_in 'Password', with: data[:password]
        click_button 'Log in'
      end
    end
  end
end
