require 'spec_helper'

describe Sail do
  context 'validations' do
    it { should have_valid(:when).when(Date.today) }
    it { should_not have_valid(:when).when(nil) }

    it { should have_valid(:details).when('ABC') }
    it { should_not have_valid(:details).when(nil, '') }

    it { should have_valid(:title).when('Making good progress') }
    it { should_not have_valid(:title).when(nil, '') }
  end

  context 'associations' do
    it { should belong_to(:user) }
  end
end
