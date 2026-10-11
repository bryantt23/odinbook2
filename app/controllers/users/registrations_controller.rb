class Users::RegistrationsController < Devise::RegistrationsController
  def create
    super do |resource|
      if resource.persisted?
        UserMailer.welcome_email(resource).deliver_now
      end
    end
  end
end