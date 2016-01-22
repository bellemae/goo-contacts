class SessionsController < ApplicationController
  def new
  end

  def create
  	auth = request.env['omniauth.auth']
 	@name = auth['info']['name']
  	token = auth['credentials']['token']

	@contacts = Contacts.new.get(token)
  end

end
