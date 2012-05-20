define [
  'collections/Collection'
  'models/Option'
  'jquery'
  'moment'
], (Collection, Option, $, moment) ->
  class OptionsCollection extends Collection

    model: Option
