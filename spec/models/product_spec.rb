require 'rails_helper'

RSpec.describe Product, type: :model do
  let(:product) { create(:product) }

  it 'is a valid product' do
    expect(product).to be_valid
  end
end
