module AuthHandler
  def check_auth(params)
    valid = params[:user] == 'admin' && params[:password] == 'admin'
    build_auth_response(valid)
  end

  def build_auth_response(auth_ok)
    response = {
      data: {
        error: 'Error! Login incorrect'
      },
      status: 403
    }

    if auth_ok
      response = {
        data: {
          logged: true
        },
        status: 200
      }
    end

    response
  end
end