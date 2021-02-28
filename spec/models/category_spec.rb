require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'Check the presence of columns' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:priority) }
  end

  describe 'Name should be unique' do
    it { should validate_uniqueness_of(:name) }
  end
end
