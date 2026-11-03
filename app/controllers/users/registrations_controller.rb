class Users::RegistrationsController < Devise::RegistrationsController
  def create
    super do |resource|
      if resource.persisted? && !Rails.env.production?
        UserMailer.welcome_email(resource).deliver_now
      end
    end
  end
end