require "rails_helper"

feature "Guest" do
  let!(:user) { create(:user) }
  let(:user_params) { {email: user.email, password: user.password} }
  let(:new_user_params) {{email: 'email@mail.com', password: 12345678}}

  scenario "can sign up", js: true do
    visit root_path
    click_link "Sign up"
    within "#sign-up" do
      fill_in "Email", with: new_user_params[:email]
      fill_in "Password", with: new_user_params[:password]
      fill_in "Password confirmation", with: new_user_params[:password]
      click_button 'Sign up'
    end
    expect(page).to have_alert "Signed up successfully."
    expect(page).to have_css "a", text: new_user_params[:email]
  end

  scenario "can sign in", js: true do
    sign_in_with user_params
    expect(page).to have_alert "Signed in successfully."
    expect(page).to have_css "a", text: user_params[:email]
  end

  scenario "sees sign-up form when he trying to add place", js: true do
    visit root_path
    click_button 'Add your place!'
    expect(page).to have_css "h4.text-info", text: "Sign up to create a new Place"
  end
end
