require 'rails_helper'

RSpec.describe Location, type: :model do
  let(:location) { create(:location) }

  it 'is a valid location' do
    expect(location).to be_valid
  end
end
