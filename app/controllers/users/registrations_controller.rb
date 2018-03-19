class Users::RegistrationsController < Devise::RegistrationsController
  def build_resource(hash = nil)
    hash[:userid] = User.create_uuid
    super
  end
end
