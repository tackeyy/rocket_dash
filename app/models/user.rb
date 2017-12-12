class User < ApplicationRecord
  acts_as_paranoid
  authenticates_with_sorcery!

  validates :email,
            uniqueness_without_deleted: true,
            email_format: true

  validates :password,
            length: { minimum: 8 },
            confirmation: true,
            if: :new_record_or_changes_password

  validates :password_confirmation,
            presence: true,
            if: :new_record_or_changes_password

  private

  def new_record_or_changes_password
    new_record? || changes[:crypted_password]
  end
end
