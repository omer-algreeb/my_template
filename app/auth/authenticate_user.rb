class AuthenticateUser
  def initialize(slug, email, password)
    @slug = slug
    @email = email
    @password = password
  end

  # Service entry point
  def call
    JsonWebToken.encode(user_id: user.id)
  end

  private

  attr_reader :slug, :email, :password

  # verify user credentials
  def user
    user = organization.users.find_by(email: email) if organization
    return user if user && user.authenticate(password)
    # raise Authentication error if credentials are invalid
    # return { message: Message.invalid_credentials }
    raise(ExceptionHandler::AuthenticationError, Message.invalid_credentials)
  end

  def organization
    @organization ||= Organization.find_by(slug: slug)
  end
end