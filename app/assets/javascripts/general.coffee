# close active modal before open another
$(document).on 'click', "[data-open-modal]", ->
  close_modal = $(this).data('close-modal')
  open_modal = $(this).data('open-modal')
  $(close_modal).modal('hide')
  setTimeout ->
    $(open_modal).modal('show')
  , 400

