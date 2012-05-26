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

###
# Questions
###

###
# Helpers
###
slugify = (text) ->
  text = text.replace /[^-a-zA-Z0-9,&\s]+/ig, ''
  text = text.replace /-/gi, '_'
  text = text.replace /\s/gi, '-'
  text.toLowerCase()

###
# Create a question.
###
app.router.post 'question', ->
  question = this.req.body
  db.save slugify(question.name), question, (err, res) =>
    this.res.json res

###
# Get a question.
###
app.router.get 'question/:id', (id) ->
  db.get id, (err, doc) =>
    this.res.json doc

###
# Update a question.
###
app.router.put 'question/:id', (id) ->
  db.save id, this.req.body, (err, doc) =>
    this.res.json doc


app.start 3000
