- active = context.request.path == "/" ? "active" : ""
a class="nav-item #{active}" href="/" Home
- active = context.request.path == "/birds" ? "active" : ""
a class="nav-item #{active}" href="/birds" Birds
