div.row
  div.col-sm-11
    h2 Movies
  div.col-sm-1
    a.btn.btn-success.btn-xs href="/movies/new" New
div.table-responsive
  table.table.table-striped
    thead
      tr
        th Name
        th Release_year
        th Actions
    tbody
      - movies.each do |movie|
        tr
          td = movie.name
          td = movie.release_year
          td
            span
              == link_to("read", "/movies/#{movie.id}", class: "btn btn-success btn-xs")
              == link_to("edit", "/movies/#{movie.id}/edit", class: "btn btn-success btn-xs")
              == link_to("delete", "/movies/#{ movie.id }?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-danger btn-xs")
