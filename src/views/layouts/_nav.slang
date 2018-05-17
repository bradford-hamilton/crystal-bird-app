- active = context.request.path == "/" ? "active" : ""
a class="nav-item #{active}" href="/" Home
- active = context.request.path == "/movies" ? "active" : ""
a class="nav-item #{active}" href="/movies" Movies
