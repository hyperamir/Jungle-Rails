require 'rails_helper'

RSpec.feature "Visitor adds product to the cart", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "My cart has been updated" do
    # ACT
    visit root_path
    click_on('Add', match: :first)
    sleep 5
    # DEBUG
    save_screenshot

    # VERIFY
    within('nav.navbar') { expect(page).to have_content('1') }
  end
end
