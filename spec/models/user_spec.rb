require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.create(:user, name: 'userA', email: 'email@example.com',
                              password: "foobar", password_confirmation: "foobar")
  end

  describe 'user name email validation' do
    context 'user presence' do
      it 'user exist values' do
        expect(@user).to be_valid
      end
      it 'user no name' do
        @user.name = ''
        expect(@user).to be_invalid
      end
      it 'user no email' do
        @user.email = ''
        expect(@user).to be_invalid
      end
    end

    context 'user length' do
      it 'name name length 50 over' do
        @user.name = 'a' * 51
        expect(@user).to be_invalid
      end
      it 'name email length 255 over' do
        @user.email = 'a' * 254 + '@example.com'
        expect(@user).to be_invalid
      end
    end

    context 'email address validation' do
      it 'not format email address' do
        invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.foo@bar_baz.com foo@bar+baz.com]
        invalid_addresses.each do |address|
          expect(FactoryBot.build(:user, email: address)).to be_invalid
        end
      end
      it 'email address not unique' do
        duplicate_user = @user.dup
        duplicate_user.email = @user.email.upcase
        @user.save!
        expect(duplicate_user).to be_invalid
      end
      it 'email address saved as lower-case' do
        mixed_case_email = "Foo@ExAMPle.CoM"
        @user.email = mixed_case_email
        @user.save!
        expect(@user.reload.email).to eq "foo@example.com"
      end
    end
  end

  describe 'user password validation' do
      it '6 blank password' do
        @user.password = @user.password_confirmation = " " * 6
        expect(@user).to be_invalid
      end
      it 'word count less than 6 ' do
        @user.password = @user.password_confirmation = "a" * 5
        expect(@user).to be_invalid
      end
  end
end
