require "rails_helper"

RSpec.describe OrderMailer, type: :mailer do
  describe "received" do
    let(:order) { create(:order, name: "Roman", email: "roman@example.com") }
    let(:product) { create(:product, title: "Ruby Book For Testing") }

    before do
      create(:line_item, order: order, product: product, quantity: 2)
    end

    let(:mail) { OrderMailer.received(order) }

    it "renders the headers" do
      expect(mail.subject).to eq("Pragmatic Store Order Confirmation")
      expect(mail.to).to eq([ "roman@example.com" ])
      expect(mail.from).to eq([ "depot@example.com" ])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Dear Roman")
      expect(mail.body.encoded).to match("2 x Ruby Book For Testing")
    end
  end
end
