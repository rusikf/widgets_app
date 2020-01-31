$ ->
  $('form#new_user').on('ajax:success', (e, data, status) ->
    location.reload()
  ).on('ajax:error', (e, data, status, xhr) ->
    alert('Validation error, please check all fields')
  )
