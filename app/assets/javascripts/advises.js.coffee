$ ->
  $("input[name='advise[choice]']").on('click', () ->
    $("#advise-form").show()
    if $("input[name='advise[choice]']:checked").val() == 'клинику'
      $(".advise_last_name").hide()
      $(".advise_name").hide()
      $(".advise_idoctor").hide()
      $(".advise_iclinic").show()
      $(".advise_full_name").show()
    else
      $(".advise_last_name").show()
      $(".advise_name").show()
      $(".advise_idoctor").show()
      $(".advise_iclinic").hide()
      $(".advise_full_name").hide()
  )

  if $("input[name='advise[choice]']:checked").val() == 'клинику'
    $("#advise-form").show()
    $(".advise_last_name").hide()
    $(".advise_name").hide()
    $(".advise_idoctor").hide()
    $(".advise_iclinic").show()
    $(".advise_full_name").show()
  else if $("input[name='advise[choice]']:checked").val() == 'доктора'
    $("#advise-form").show()
    $(".advise_last_name").show()
    $(".advise_name").show()
    $(".advise_idoctor").show()
    $(".advise_iclinic").hide()
    $(".advise_full_name").hide()


