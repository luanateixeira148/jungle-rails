require 'rails_helper'

RSpec.describe ProductSpec, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    it 'saves the product if name, quantity, price and category are filled' do
    
      @category = Category.new(name: 'New Test Category')
      @product = Product.new(name: 'New Test Product', quantity: 3, price: 10.00, category: @category)
      expect(@product).to_be_valid

    end 

    it 'fails if name is not defined' do
    
      @category = Category.new(name: 'New Test Category')
      @product = Product.new(name: nil, quantity: 3, price: 10.00, category: @category)
      expect(@product).to_not_be_valid
    
    end

    it 'fails if quantity is not defined' do
    
      @category = Category.new(name: 'New Test Category')
      @product = Product.new(name: 'New Test Product', quantity: nil, price: 10.00, category: @category)
      expect(@product).to_not_be_valid
    
    end

    it 'fails if price is not defined' do
    
      @category = Category.new(name: 'New Test Category')
      @product = Product.new(name: 'New Test Product', quantity: 3, price: nil, category: @category)
      expect(@product).to_not_be_valid
    
    end

    it 'fails if category is not defined' do
    
      @product = Product.new(name: 'New Test Product', quantity: 3, price: nil, category: nil)
      expect(@product).to_not_be_valid
    
    end

  end
end
