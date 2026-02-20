require 'rails_helper'

RSpec.describe "Orders Checkout Flow", type: :system do
  include ActiveJob::TestHelper

  let!(:product) { create(:product) }

  it "completes the full checkout and sends an email" do
    visit store_index_path
    click_on "Add to Cart"

    expect(page).to have_content("1 \u00D7")

    click_on "Checkout"

    expect(page).to have_content("Please Enter Your Details")
    fill_in "Name", with: "Dave Thomas"
    fill_in "Address", with: "123 Main Street"
    fill_in "Email", with: "dave@example.com"

    select "Check", from: "Pay type"
    fill_in "Routing number", with: "123456"
    fill_in "Account number", with: "987654"

    click_button "Place Order"

    expect(page).to have_text("Thank you for your order")

    perform_enqueued_jobs
    perform_enqueued_jobs

    order = Order.last
    expect(order.name).to eq("Dave Thomas")
    expect(order.pay_type).to eq("Check")
    expect(order.line_items.size).to eq(1)

    mail = ActionMailer::Base.deliveries.last
    expect(mail.to).to eq([ "dave@example.com" ])
    expect(mail.subject).to eq("Pragmatic Store Order Confirmation")
  end
end
