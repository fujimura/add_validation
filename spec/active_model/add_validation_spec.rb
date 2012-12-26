require 'spec_helper'

describe User do
  describe 'with preparation' do
    let(:user) { User.new name: "Alice" }
    before do
      user.prepare_to_create_primary_address
    end

    it 'should be able to set primary address' do
      expect do
        user.primary_address = nil
      end.to_not raise_error NoMethodError
    end

    context 'when no address was given' do
      it 'should be invalid' do
        user.primary_address = nil
        user.valid?
        user.errors[:primary_address].should include "Primary address is not assgined"
      end
    end

    context 'when an address was given' do
      it 'should be valid' do
        user.primary_address = Address.new tel: '090-1234-5678'
        user
        user.should be_valid
      end
    end

    describe 'created address' do
      it 'should be primary address' do
        user.primary_address = Address.new tel: '090-1234-5678'
        user.save_with_primary_address
        user.addresses.first.should be_primary
      end
    end
  end

  describe 'with no preparation' do
    let(:user) { User.new name: "Alice" }
    # do no preparation

    it 'should not be able to set primary address' do
      expect do
        user.primary_address = nil
      end.to raise_error NoMethodError
    end
  end
end
