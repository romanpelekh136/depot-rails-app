require 'rails_helper'

RSpec.describe "/products", type: :request do
  describe "DELETE /destroy" do
    it "deletes a product that is empty" do
      product = create(:product)

      expect {
        delete product_path(product)
    }.to change(Product, :count).by(-1)
    end

    it "cannot delete a product that is in a cart" do
      product = create(:product)
      create(:line_item, product: product)

      expect {
        delete product_path(product)
    }.to raise_error(ActiveRecord::RecordNotDestroyed)
    end
  end
end
