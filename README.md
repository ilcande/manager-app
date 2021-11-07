## Objective
Following the steps from the contractor app, here I am going to build a `Consumer` (the manager) to receive the data sent by the `Producer` (the contractor, from the contractor-app).

## Configuration
We need to add dependencies to our Gemfile:
```
gem 'redis-rails'
gem 'redis-namespace'
gem 'sneakers'
gem 'bunny'
```

* Redis: In-memory data structure store, used as a database, cache and message broker.
* Redis-Namespace: Redis::Namespace provides an interface to a namespaced subset of your Redis keyspace.
* Sneakers: a high-performance RabbitMQ background processing framework for Ruby. It made especially for processing messages that come from queues
* Bunny: as for the producer.

First things to do is to create initializers for the dependencies and connect the Manager (consumer) to the Contractor (producer) by creating the queue `(manager_dashboard.payment_requests)`.

So, I create a rake task and I add it to the app. It will allow to initialize the connection between the two apps throughout `RabbitMQ`.

Then I need to add a payment request worker to handle the message sent by the exchange that I have created in the contractor app.

At this point the manager is connected to the contractor and we are able to play with data

We need 3 terminal windows open, in one lift up RabbitMQ server
```
/usr/local/opt/rabbitmq/sbin/rabbitmq-server
```

In the second one we need to action the work method that allow us to retrieve data
```
WORKERS=PaymentRequestsWorker bundle exec rake sneakers:run
rake rabbitmq:setup
```
Make sure you browse to http://localhost:15672/ and click on Exchange tab, `display.payment_requests`

In a third terminal create a payment request from the contractor rails console. Once created a curve in the RabbitMQ Exchange tab will display which means the data sent by the producer is displayed.

## Improvements
* `ActionCable` could be used to display data in real time
* Use background job `Sidekiq`: What about using background job to synchronize data ?
