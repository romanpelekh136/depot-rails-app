require 'rails_helper'

RSpec.describe "Orders", type: :system do
  let!(:product) { create(:product) }

  it "toggles payment fields dynamically" do
    visit store_index_path
    click_on "Add to Cart"
    click_on "Checkout"

    expect(page).to have_no_content("Routing number")

    select "Check", from: "Pay type"

    expect(page).to have_content("Routing number")

    select "Credit card", from: "Pay type"

    expect(page).to have_no_content("Routing number")
    expect(page).to have_content("Credit card number")
  end
end
