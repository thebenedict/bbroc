$ ->
  # Configure infinite table
  $('#wrap').infinitePages
    debug: true
    loading: ->
      console.log "loading"
      $(this).text('Loading next page...')
    error: ->
      $(this).button('There was an error, please try again')