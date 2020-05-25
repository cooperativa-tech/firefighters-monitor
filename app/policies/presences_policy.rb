PresencesPolicy = Struct.new(:user, :presences) do
  def index?
    user.admin?
  end
end
