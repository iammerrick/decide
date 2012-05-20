define ['views/View'], (View) ->
  View
    template: """
      <div class="grey-box">
        <input type="text" class="js-question" placeholder="Where should we go to lunch today?" />
        <input type="submit" value="Create!" />
      </div>
    """
