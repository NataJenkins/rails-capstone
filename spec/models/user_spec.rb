require 'rails_helper'

RSpec.describe User, type: :model do    
      describe 'Username uniqueness' do
        it { should validate_uniqueness_of(:username) }
      end  

      describe 'username and name should be filled' do
        it { should validate_presence_of(:username) }
        it { should validate_presence_of(:name) }
      end

      describe 'association' do
        it { should have_many(:articles) }
        it { should have_many(:votes) }
      end
end