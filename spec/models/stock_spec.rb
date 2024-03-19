require 'rails_helper'

RSpec.describe Stock, type: :model do
  let(:stock) { create(:stock) }

  it 'is a valid stock' do
    expect(stock).to be_valid
  end
end
