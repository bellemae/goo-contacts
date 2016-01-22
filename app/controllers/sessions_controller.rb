class SessionsController < ApplicationController
  def new
  end

  def create
  	auth = request.env['omniauth.auth']
  	token = auth['credentials']['token']
	@contacts = Contacts.new.get(token)
  end

end
