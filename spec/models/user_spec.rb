# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  admin                  :boolean          default(FALSE), not null
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { build(:user) }

  describe 'attributes' do
    it 'has the expected attributes', aggregate_failures: true do
      expect(user).to respond_to(:email)
      expect(user).to respond_to(:encrypted_password)
      expect(user).to respond_to(:admin)
      expect(user).to respond_to(:special_code)
    end
  end

  describe 'indexes' do
    it 'has the expected indexes', aggregate_failures: true do
      expect(user).to have_db_index(:email)
      expect(user).to have_db_index(:reset_password_token)
    end
  end

  describe 'validations' do
    context 'when the user has no given email' do
      subject(:user) { build_stubbed(:user, email: '') }

      it { is_expected.not_to be_valid }
    end

    context 'when the user has no given password' do
      subject(:user) { build_stubbed(:user, password: '') }

      it { is_expected.not_to be_valid }
    end

    context 'when the user has an already registered email' do
      subject(:user) do
        build_stubbed(:user, email: 'already_taken@email.com')
      end

      before { create(:user, email: 'already_taken@email.com') }

      it { is_expected.not_to be_valid }
    end

    context 'when the user is admin and has an invalid special code' do
      subject(:user) { build_stubbed(:admin_user) }

      before do
        allow(user).to receive(:special_code=).and_return('A_WRONG_CODE')
      end

      it { is_expected.not_to be_valid }
    end
  end
end
