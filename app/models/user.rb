class User < ActiveRecord::Base
  has_many :authentications, :dependent => :delete_all
  has_many :access_grants, :dependent => :delete_all

  before_validation :initialize_fields, :on => :create

  devise :database_authenticatable, :registerable, :token_authenticatable,
         :recoverable, :timeoutable, :trackable, :validatable, :rememberable

  self.token_authentication_key = "oauth_token"

  attr_accessible :email, :password, :password_confirmation, :remember_me, :last_name, :first_name, :middle_name, :id

  validates_presence_of :last_name, :first_name, :middle_name

  searchable do
    text :term do
      "#{email} #{first_name} #{last_name}"
    end
  end

  def to_s
   "#{self.first_name} #{self.middle_name} #{self.last_name}"
  end

  def apply_omniauth(omniauth)
    authentications.build(:provider => omniauth['provider'], :uid => omniauth['uid'])
  end

  def self.find_for_token_authentication(conditions)
    where(["access_grants.access_token = ? AND (access_grants.access_token_expires_at IS NULL OR access_grants.access_token_expires_at > ?)", conditions[token_authentication_key], Time.now]).joins(:access_grants).select("users.*").first
  end

  def initialize_fields
    self.status = "Active"
    self.expiration_date = 1.year.from_now
  end

end
# == Schema Information
#
# Table name: users
#
#  id                   :integer         not null, primary key
#  email                :string(255)     default(""), not null
#  encrypted_password   :string(128)     default(""), not null
#  reset_password_token :string(255)
#  remember_created_at  :datetime
#  sign_in_count        :integer         default(0)
#  current_sign_in_at   :datetime
#  last_sign_in_at      :datetime
#  current_sign_in_ip   :string(255)
#  last_sign_in_ip      :string(255)
#  authentication_token :string(255)
#  admin                :boolean         default(FALSE)
#  first_name           :string(255)
#  last_name            :string(255)
#  status               :string(255)
#  expiration_date      :date
#  created_at           :datetime
#  updated_at           :datetime
#  middle_name          :string(255)
#

