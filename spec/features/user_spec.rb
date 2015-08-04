require "rails_helper"

feature "User" do
  let!(:user){ create(:user) }
  let(:user_params){{email: user.email, password: user.password}}
  let(:place_params){{name: "Name", description: "Desc", image: "http://a.com/a.png"}}

  scenario "can sign out", js: true do
    sign_in_with user_params
    click_link user.email
    click_link 'Sign out'
    expect(page).to have_alert "Signed out successfully.", :notice
  end

  scenario "can add new place and see it on landing page", js: true do
    sign_in_with user_params

    click_button "Add your place!"
    within "#new-place-modal" do
      fill_in "Name", with: place_params[:description]
      fill_in "Description", with: place_params[:description]
      fill_in "Image", with: place_params[:image]
      click_button 'Create Place'
    end
    expect(page).to have_alert "New place has been added"

    expect(page).to have_css "h3.panel-title", text: place_params[:title]
    img_src = find('.img-resized')['src']
    expect(img_src).to eq place_params[:image]
    expect(page).to have_css "div.panel-body", text: place_params[:description]
    expect(page).to have_css "div.panel-footer", text: user.email
  end

end
