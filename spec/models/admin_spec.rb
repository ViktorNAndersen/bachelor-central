require 'rails_helper'

RSpec.describe Admin, type: :model do
  let(:admin) { create(:admin) }

  it 'is a valid admin' do
    expect(admin).to be_valid
  end
end
