ready = ->
  # close active modal before open another
  $("[data-open-modal]").click ->
    close_modal = $(this).data('close-modal')
    open_modal = $(this).data('open-modal')
    $(close_modal).modal('hide')
    setTimeout ->
      $(open_modal).modal('show')
    , 400

$(document).ready(ready)
$(document).on('page:load',ready)
