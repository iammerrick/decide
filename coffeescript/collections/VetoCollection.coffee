define [
  'collections/Collection'
  'models/Veto'
], (Collection, Veto) ->
  class VetoCollection extends Collection

    model: Veto 

