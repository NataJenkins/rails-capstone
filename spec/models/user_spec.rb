require 'rails_helper'

RSpec.describe User, type: :model do    
      describe 'Username uniqueness' do
        it { should validate_uniqueness_of(:username) }
      end  
end