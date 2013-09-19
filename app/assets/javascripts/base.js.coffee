jQuery ->
  $('.datepicker').datepicker({
        format: 'dd.mm.yyyy',
        autoclose: true,
        language: 'ru',
        weekStart: 1
    })
  $("form").bind 'nested:fieldAdded', () ->
    $('input').bind 'railsAutocomplete.select', (event, data) ->
      prefix = event.target.id.replace /product_name/, ""
      prefix_name = event.target.name.replace /\[product_name\]/, ""
      product_id = data.item.id
      $.ajax
        type: 'POST',
        url: "get_unit"
        data: 'product_id=' + product_id + '&prefix_name=' + prefix_name + '&prefix=' + prefix,
        dataType: 'script'

  # Limit comment characters
  $("#comment_message").attr('maxlength', '1000')
  $('#comment_message').on 'keypress', ->
    currentText = $(this).val()
    if (currentText.length > 0)
      $("#length").text("Осталось " + (1000 - currentText.length) + " символов")

  $('#editor').wysihtml5({cols: '50', html: true, locale: "ru-RU"})
  $('.alert').delay(5000).fadeOut('slow')