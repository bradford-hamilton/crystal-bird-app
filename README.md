# crystal-bird-app

[https://crystal-bird-app.herokuapp.com/](https://crystal-bird-app.herokuapp.com/)

## Installation

1. Run `shards install`

## Usage

To setup your database edit `database_url` inside `config/environments/development.yml` file.

To edit your production settings use `amber encrypt`. [See Docs](https://amberframework.gitbook.io/amber/cli/encrypt)

To run amber server in a **development** enviroment:

```
amber db create migrate
amber watch
```

To build and run a **production** release:

1. Add an environment variable `AMBER_ENV` with a value of `production`
2. Run these commands (Note using `--release` is optional and may take a long time):

```
npm run release
amber db create migrate
shards build --production --release
./bin/crystal-bird-app
```

## Docker Compose

To set up the database and launch the server:

```
docker-compose up -d
```

To view the logs:

```
docker-compose logs -f
```

> **Note:** The Docker images are compatible with Heroku.

## Contributing

1. Fork it ( https://github.com/your-github-user/crystal-bird-app/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [bradford-hamilton](https://github.com/bradford-hamilton) Bradford Lamson-Scribner - creator, maintainer
