require 'rails_helper'

RSpec.describe Product, type: :model do
  it "product attr must not be empty" do
    product = Product.new

    expect(product).to be_invalid
    expect(product.errors[:title]).to be_present
    expect(product.errors[:description]).to be_present
    expect(product.errors[:price]).to be_present
    expect(product.errors[:image]).to be_present
  end

  it "product price must be positive" do
    product = build(:product)

    product.price = -1
    expect(product).to be_invalid
    expect(product.errors[:price]).to eq([ "must be greater than or equal to 0.01" ])

    product.price = 0
    expect(product).to be_invalid
    expect(product.errors[:price]).to eq([ "must be greater than or equal to 0.01" ])

    product.price = 1
    expect(product).to be_valid
  end
end
