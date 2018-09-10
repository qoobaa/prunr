class ApplicationService
  include Singleton

  class << self
    delegate :call, to: :instance
  end
end
