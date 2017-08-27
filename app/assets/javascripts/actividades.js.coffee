# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $(document).on 'change', '#actividades_select', (evt) ->
    $.ajax 'mapa',
      type: 'GET'
      dataType: 'script'
      data: {
        cat_tipo_actividad_id: $("#actividades_select option:selected").val(),
        valor_id: ""
      }
      error: (jqXHR, textStatus, errorThrown) ->
        console.log("AJAX Error: #{textStatus}")
      success: (data, textStatus, jqXHR) ->
        console.log("Dynamic country select OK!")

$ ->
  $(document).on 'dblclick', (evt) ->
    if evt.target.className == "form-control participaciones_select"
      $.ajax 'mapa',              
        type: 'GET'
        dataType: 'script'
        data: {
          cat_tipo_actividad_id: $("#actividades_select option:selected").val(),
          valor_id: ""+evt.target.id
        }
        error: (jqXHR, textStatus, errorThrown) ->
          console.log("AJAX Error: #{textStatus}")
        success: (data, textStatus, jqXHR) ->
          console.log("Dynamic country select OK!")
			
$ ->
  $(document).on 'dblclick', (evt) ->
    if evt.target.className == "form-control descripcion_textarea"
      $.ajax 'mapa_descripcion',              
        type: 'GET'
        dataType: 'script'
        data: {
          cat_tipo_actividad_id: $("#actividades_select option:selected").val()
        }
        error: (jqXHR, textStatus, errorThrown) ->
          console.log("AJAX Error: #{textStatus}")
        success: (data, textStatus, jqXHR) ->
          console.log("OK!")

		