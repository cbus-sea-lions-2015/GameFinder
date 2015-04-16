require 'rails_helper'
require 'capybara/rspec'

RSpec.feature "User visits page without login in" do

  scenario "when a user visits the home page the user can see brand and links" do
    visit '/'
    expect(page).to have_content("GameFinder")
    expect(page).to have_link("Log In")
    expect(page).to have_link("Sign Up")
  end

end