require 'rails_helper'

RSpec.describe Log, type: :model do
  let(:log) { create(:log) }

  it 'is a valid log' do
    expect(log).to be_valid
  end
end
