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
