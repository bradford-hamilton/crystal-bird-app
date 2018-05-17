div.row
  div.col-sm-11
    h2 Birds
  div.col-sm-1
    a.btn.btn-success.btn-xs href="/birds/new" New
div.table-responsive
  table.table.table-striped
    thead
      tr
        th Name
        th Age
        th Actions
    tbody
      - birds.each do |bird|
        tr
          td = bird.name
          td = bird.age
          td
            span
              == link_to("read", "/birds/#{bird.id}", class: "btn btn-success btn-xs")
              == link_to("edit", "/birds/#{bird.id}/edit", class: "btn btn-success btn-xs")
              == link_to("delete", "/birds/#{ bird.id }?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-danger btn-xs")
