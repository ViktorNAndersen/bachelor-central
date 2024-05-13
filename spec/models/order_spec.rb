require 'rails_helper'

RSpec.describe Order, type: :model do
  let(:order) { create(:order) }

  it 'is a valid order' do
    expect(order).to be_valid
  end

  it 'is not valid without an employee' do
    order.ordered_by = nil
    expect(order).to_not be_valid
  end

end
