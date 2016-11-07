# WebService1

## Development

> Make sure you have installed [Ruby 2.3.1](https://www.ruby-lang.org/es/downloads/).

Clone this repository:

```sh
git clone https://github.com/mrpatiwi/ACID-webservice1.git
```

Install dependencies:

```sh
bundle install
```

Setup environment variables:

```sh
export EMAIL_USERNAME=username
export EMAIL_PASSWORD=password
export EMAIL_DOMAIN=sender.mydomain.com

# To connect with WebService2:
export SERVICE_URI=http://localhost:4000 # change as needed
```

Run web app at [`http://localhost:3000`](http://localhost:3000):

```sh
rails start
```

## Deploy

See: [mrpatiwi/ACID-deploy](https://github.com/mrpatiwi/ACID-deploy).
