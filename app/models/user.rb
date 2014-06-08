# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  provider               :string(255)
#  url                    :string(255)
#  first_name             :string(255)
#  last_name              :string(255)
#  role_id                :integer
#  packet_file_name       :string(255)
#  packet_content_type    :string(255)
#  packet_file_size       :integer
#  packet_updated_at      :datetime
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:vkontakte]

  belongs_to :role
  has_many :conversations


  def self.find_for_vkontakte_oauth access_token
    if user = User.where(:url => access_token.info.urls.Vkontakte).first
      user
    else 
      User.create!(:provider => access_token.provider,
       :url => access_token.info.urls.Vkontakte,
       :first_name => access_token.info.first_name,
       :last_name => access_token.info.last_name,
       :email => "#{access_token.uid}@elections.dev",
       :password => Devise.friendly_token[0,20],
       :role_id => 1)
    end
  end

  def talk_to voter_id
  	voter = Voter.find_by_id(voter_id)
  	conversation = Conversation.create!({ user_id: self.id, voter_id: voter.id })
    voter.update_column(:conversation_status, 1)
  	conversation
  end

  def self.volunteers
    self.where("role_id in (?)", 3)
  end

  def admin?
    role_id > 2
  end

  
  def name
    "#{first_name} #{last_name}"
  end
end
