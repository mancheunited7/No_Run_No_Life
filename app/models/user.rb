class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :validatable, :confirmable, :omniauthable

  has_many :run_records, dependent: :destroy
  has_many :user_comp_schedules, dependent: :destroy
  has_many :competition_infos, through: :user_comp_schedules
  has_many :comments, dependent: :destroy
  has_many :boards, dependent: :destroy

  validates :name, presence: true

  def self.find_userinfo(auth)
    user = User.find_by(provider: auth.provider, userid: auth.uid)

    if user.nil?
        user = User.new(
          email: "#{auth.uid}@#{auth.provider}.com",
          provider: auth.provider,
          userid: auth.uid,
          name: auth.info.name,
          password: Devise.friendly_token[0,20]
        )
      user.skip_confirmation!
      user.save
    end
    user
  end

  def self.create_uuid
    SecureRandom.uuid
  end

  def self.run_level_up_decision(user_id)
    user = User.find(user_id)
    user.total_run_experience = user.run_records.sum(:run_distance)

    if user.total_run_experience > RunExperience.find_by(run_level: user.run_level.to_i + 1).need_experience_point
      user.run_level += 1
    end
    user.save
  end

end
