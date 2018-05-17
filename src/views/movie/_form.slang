- if movie.errors
  ul.errors
    - movie.errors.each do |error|
      li = error.to_s

== form(action: "/movies/#{movie.id.to_s}", method: movie.id ? :patch : :post) do
  == csrf_tag
  div.form-group
    == text_field(name: "name", value: movie.name, placeholder: "Name", class: "form-control")
  div.form-group
    == text_field(name: "release_year", value: movie.release_year, placeholder: "Release_year", class: "form-control")
  == submit("Submit", class: "btn btn-primary btn-xs")
  == link_to("back", "/movies", class: "btn btn-default btn-xs")
