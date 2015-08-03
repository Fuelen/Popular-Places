ready = ->
  # Show modal window with form to add new place.
  # When new-place-form is true then user is signed in and we show him
  # modal window with form to add new place.
  # When new-place-form is false then we show modal window with
  # sign up form and notification there
  $("button#add-new-place").click (e) ->
    signed_in = $(this).data("new-place-form")
    if signed_in
      $('#new-place-modal').modal('show')
    else
      $('#sign-up-notifications').html('<h4 class="text-info">Sign up to create a new Place</h4>')
      $('#sign-up').modal('show')

  # Clear notifications when close #sign-up modal window
  $('#sign-up').on 'hidden.bs.modal', ->
     $('#sign-up-notifications').empty()

$(document).ready(ready)
$(document).on('page:load',ready)
