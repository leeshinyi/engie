## Development

### Prerequisites

The setups steps expect following tools installed on the system.

- Ruby 2.7.6
- Rails ~> 6.1.7
- SQLite3

### 1. Create and setup the database

Run the following commands to create and setup the database.

```ruby
bundle exec rake db:create
bundle exec rake db:migrate
bundle exec rake db:seed
```

### 2. Start the Rails server

You can start the rails server using the command given below.

```ruby
bundle exec rails s
```

And now you can test out the API with the URL http://localhost:3000. The following 2 endpoints are available to play around with:

```
/api/v1/users
/api/v1/users/{id}
```

For testing the API, you would need an API client like Postman or something similar.

### 3. Start the Rails console

You can start the rails console using the command given below.

```ruby
bundle exec rails c
```

## Extend Model

Extend any model by adding custom attributes with the `ExtendedAttribute` model by associating it with:

```
 has_many :extended_attributes, as: :extendable
```

A custom finder is available. The "parent" model are also searchable by their custom fields by using the custom query `find_every`. Add the following call in the model you are extending:

```
 extend CustomFinder
```

Your model should eventually look similar to this:

```
class User < ApplicationRecord
  extend CustomFinder

  has_many :extended_attributes, as: :extendable
end
```

## Searching

CAVEAT:
- The search by the extended attribute is currently optimal to only 1 field and value pair.

Examples:

```
# This will be using the Rails `where` query method and
# should return a result if found.

User.find_every(id: 3)


# `name` attribute is an "extended" model "column" and
# will use the custom search we have added as an extension

User.find_every(name: "Sonny Bashirian")


# The 2 attributes are part of the "parent" model's columns

User.find_every(id: 3, first_name: "Milan")


# `id` attribute belongs to the "parent" model
# `battery_capacity` belongs to the "extended" model
# This will yield a result based on the `capacity` field as this exists

User.find_every(id: 3, capacity: "40")

```


NOTES:
- Seed data has been provided to initially play around with it.
- 3 custom field was seeded `name`, `phone`, `capacity`
- An enum of `partner` was added to distinguish attributes apart