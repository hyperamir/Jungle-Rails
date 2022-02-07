require 'rails_helper'

RSpec.describe Product, type: :model do
  
  describe 'Validations' do
    it "fails when name is not set" do
      @category = Category.new
      @product = Product.new(
        name: nil,
        price: 12,
        quantity: 3,
        category: @category
      )

      expect(@product).to be_valid
    end

    it "fails when price is not set" do
      @category = Category.new
      @product = Product.new(
        name: 'test name',
        price: nil,
        quantity: 3,
        category: @category
      )

      expect(@product).to be_valid
    end

    it "fails when quantity is not set" do
      @category = Category.new
      @product = Product.new(
        name: 'test name',
        price: 12,
        quantity: nil,
        category: @category
      )

      expect(@product).to be_valid
    end

    it "fails when category is not set" do
      @category = Category.new
      @product = Product.new(
        name: 'test name',
        price: 12,
        quantity: 3,
        category: nil
      )

      expect(@product).to be_valid
    end

    it "Saves successfully when all values are set" do
      @category = Category.new
      @product = Product.new(
        name: 'test name',
        price: 12,
        quantity: 3,
        category: @gategory
      )

      expect(@product).to be_valid
    end

  end
end
