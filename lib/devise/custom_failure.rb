  class CustomFailure < Devise::FailureApp
    def redirect_url
      root_path
    end

    def respond
      byebug
      if http_auth?
        http_auth
      else
        redirect
      end
    end
  end