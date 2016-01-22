# goo-contacts

This application allows a user to log in to their Google account and displays their contacts. 

A bit of setup is required to allow the authentication with Google to work. 

Go to your developer console at Google https://console.developers.google.com and create a new project.
	
	It will ask for 'Authorized JavaScript origins' && 'Authorized redirect URIs'
	
		If you are going to deploy the application to a live server, then you simply put the URI of the application & yourapp/auth/google_oauth2/callback for the redirect. If you are wanting to run it from your localhost you'll need to create a publicly visible url for google. 

		Here I use ngrok, it's very quick & easy to download & setup https://ngrok.com/
		Download, unzip, go to the directory where it's located and run ./ngrok http 3000.
		Ngrok will show the publicly visible addresses, which look something like: http://d60sd04e.ngrok.io
		use this for 'Authorized JavaScript origins'. Now fill in Authorized redirect URIs with the same address followed by /auth/google_oauth2/callback

	When you save it will provide you with a client id & a client secret.

Create a file in the project config/secrets.yml
Add the client id & a client secret to this file, it will look like:

	client_id: 26asdfasdfd2-2djasdfdfu85orfu02lueonc2fdfd.apps.googleusercontent.com
 	client_secret: oqyasdfdvlE_jkasdfasdfj

Start your rails server.
Now you can use the application by going to the ngrok address used above (or obviously your live address if you've got it hosted)

NOTE: If you're using ngrok, be sure not to restart while you're running things. If you do you'll be assigned a new url and will need to update your google dev account, and update your secrets file with the new details. 