require 'rails_helper'

RSpec.describe Order, type: :model do
  let(:order) { create(:order) }

  it 'is a valid order' do
    expect(order).to be_valid
  end
end
