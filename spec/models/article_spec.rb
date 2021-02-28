require 'rails_helper'

RSpec.describe Article, type: :model do
  describe 'associations' do
    it { should have_many(:votes) }
    it {
      should belong_to(:author).class_name('User')
        .with_foreign_key('author_id')
    }
  end
end
