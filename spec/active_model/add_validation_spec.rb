require 'spec_helper'

describe User do
  describe 'at creation' do
    let(:user) { User.new name: "Alice" }
    before do
      user.prepare_to_create_primary_address
    end

    context 'with no addresses' do
      it 'should be invalid' do
        user.primary_address = nil
        user.valid?
        user.errors[:primary_address].should include "Primary address is not assgined"
      end
    end

    context 'with one address' do
      before do
        user.primary_address = Address.new tel: '090-1234-5678'
        user
      end

      it 'should be valid' do
        user.should be_valid
      end
    end

    describe 'created address' do
      before do
        user.primary_address = Address.new tel: '090-1234-5678'
        user.save_with_primary_address
      end

      it 'should be primary address' do
        user.addresses.first.should be_primary
      end
    end
  end
end
