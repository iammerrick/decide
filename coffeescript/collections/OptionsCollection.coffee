define [
  'collections/Collection'
  'models/Option'
], (Collection, Option) ->
  class OptionsCollection extends Collection

    model: Option
