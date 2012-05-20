define ['use!handlebars', 'use!underscore'], (Handlebars, _) ->
  (options) ->
    settings = _.defaults options,
      helpers:
        link: (text, url) ->
          text = Handlebars.Utils.escapeExpression(text)
          url = Handlebars.Utils.escapeExpression(url)

          result = '<a href="' + url + '">' + text + '</a>'

          new Handlebars.SafeString(result)

    for key, helper of settings.helpers
      Handlebars.registerHelper key, helper

    Handlebars.compile(options.template)
