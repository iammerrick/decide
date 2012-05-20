##
# Get the dependencies
##
flatiron = require 'flatiron'
ecstatic = require 'ecstatic'
cradle = require 'cradle'

##
# Setup Couch
##
db = new cradle.Connection()
db = db.database('decide')

##
# Set up the flatiron applications
##
app = flatiron.app
app.use flatiron.plugins.http

##
# Middleware before stack
##
app.http.before = [
	ecstatic "#{__dirname}/public"
]

app.start 3000
