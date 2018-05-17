h1 Show Bird
p = bird.name
p = bird.age
p
  == link_to("back", "/birds", class: "btn btn-success btn-xs")
  == link_to("edit", "/birds/#{bird.id}/edit", class: "btn btn-success btn-xs")
  == link_to("delete", "/birds/#{bird.id}?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-danger btn-xs")
