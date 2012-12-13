require 'spec_helper'

describe User do
  describe 'at creation' do
    context 'with no addresses' do
      let(:user) { User.new name: "Alice" }

      it 'should be invalid' do
        user.extend CreatePrimaryAddress
        user.valid?
        user.errors[:primary_address].should include "Primary address is not assgined"
      end
    end

    context 'with one address' do
      let(:user) { User.new name: "Alice" }

      before do
        user.extend CreatePrimaryAddress
        user.primary_address = Address.new tel: '090-1234-5678'
        user
      end

      it 'should be valid' do
        user.should be_valid
      end
    end

    describe 'created address' do
      let(:user) { User.new name: "Alice" }

      before do
        user.extend CreatePrimaryAddress
        user.primary_address = Address.new tel: '090-1234-5678'
        user.save_with_primary_address
      end

      it 'should be primary address' do
        user.addresses.first.should be_primary
      end
    end
  end
end
