require 'rails_helper'

RSpec.describe Supplier, type: :model do
  let(:supplier) { create(:supplier) }

  it 'is a valid supplier' do
    expect(supplier).to be_valid
  end
end
