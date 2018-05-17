- if bird.errors
  ul.errors
    - bird.errors.each do |error|
      li = error.to_s

== form(action: "/birds/#{bird.id.to_s}", method: bird.id ? :patch : :post) do
  == csrf_tag
  div.form-group
    == text_field(name: "name", value: bird.name, placeholder: "Name", class: "form-control")
  div.form-group
    == text_field(name: "age", value: bird.age, placeholder: "Age", class: "form-control")
  == submit("Submit", class: "btn btn-primary btn-xs")
  == link_to("back", "/birds", class: "btn btn-default btn-xs")
