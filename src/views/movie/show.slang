h1 Show Movie
p = movie.name
p = movie.release_year
p
  == link_to("back", "/movies", class: "btn btn-success btn-xs")
  == link_to("edit", "/movies/#{movie.id}/edit", class: "btn btn-success btn-xs")
  == link_to("delete", "/movies/#{movie.id}?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-danger btn-xs")
