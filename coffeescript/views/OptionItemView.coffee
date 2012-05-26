define ['views/View'], (View) ->
  View
    template: """
      {{name}}
      <a class="veto">Veto <span class="bold">{{vetoLength}}</span></a>
    """
