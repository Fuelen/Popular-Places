require "rails_helper"

feature "Visitor" do
  let(:place_params){{name: "Name", description: "Description", image: "http://a.png"}}

  scenario "can add place and see his place on landing page" do
    visit root_path
    click_button "Add your place!"
    click_button 'Create Place'
    expect(page).to have_content "Please review the problems below"
    fill_in "Name", with: place_params[:description]
    fill_in "Description", with: place_params[:description]
    fill_in "Image", with: place_params[:image]
    click_button 'Create Place'
    expect(page).to have_content "New place has been added"
    expect(page).to have_css "div.alert.alert-dismissable.alert-success",
      text: "New place has been added"
    expect(page).to have_css "h3.panel-title", text: place_params[:title]

    img_src = find(:xpath, "//img[@class='img-resized']")['src']

    expect(img_src).to eq place_params[:image]
    expect(page).to have_css "div.panel-footer", text: place_params[:description]
  end

end
