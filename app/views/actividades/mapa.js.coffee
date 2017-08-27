valor = '<%= @valor %>'
console.log(valor)
if valor == ""
	$(".participaciones_select").empty()
  		.append("<%= escape_javascript(render(:partial => @participaciones)) %>")
else
	valor = '#'+valor
	console.log(valor)
	$("#<%= @valor %>").empty()
  		.append("<%= escape_javascript(render(:partial => @participaciones)) %>")