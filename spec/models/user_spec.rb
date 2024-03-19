require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { create(:user) }

  it 'is a valid user' do
    expect(user).to be_valid
  end
end
