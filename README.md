# Microservices in Go(Golang)

In monolithic applications all of your business logic, your connection to the database or authentication, everything is built into a single application and that works really well and it's useful for a lot of cases. 

But in the modern world applications that need to scale, microservice based application is preferred. Application which can be scaled easily, a resilient distributed applications. This is an example of distributed applications, instead of just having one big monolith, we have many smaller applications that do one thing and do it well.

An application can have multiple services like front end service, authentication service, logging service, mailing service etc.. as shown below in diagram.
![image](https://user-images.githubusercontent.com/30834801/209208830-8efc6ba8-738f-4bae-8447-7b7db5dda282.png)

![image](https://user-images.githubusercontent.com/30834801/209208763-c8c563de-a155-49cc-8e9a-135005d6807f.png)


User at the very top can hits any of the front ends each of which is its own application and its only serve up web pages, nothing else.

If user needs to send email, that front end microservice contacts the mail microservice, and all that does is send mail. It don’t know anything about the front end other than how to receive a request from it for sending email.
![image](https://user-images.githubusercontent.com/30834801/209208872-eb8f2005-9a35-4626-af6c-b955b16e6103.png)


If user needs to authenticate well the front end microservice contacts authentication service. Authentication service, all it knows is about the username and password nothing else, and will give response back that user name and password is valid or not. Similarly we can have multiple services like this. 

All of these microservices are loosely coupled, and if we want to change one, we don't have to change the entire application. Each microservice can be written in different language and each one can have its own database.
 
In this example, the authentication service is reading to in writing from Postgres database, the logging service is reading and writing to Mongo database.

In micro service architecture most obvious question arises is about communication between these services. How do these microservices talk to each other ?

The most common and the easiest is to use a standard JSON rest API. So each microservice reads and writes JSON. There are other approaches as well, like RPC which are much faster than JSON and gRPC, which is even
faster than RPC in many cases. gRPC is faster than RPC in many cases but not always.

Microservices and also talk to the individual microservices by pushing something into a queue like RabbitMQ.

In this example we're going to build a front end web application, a very simple web application that serves up a few Web pages and that will connect to five different microservices.

1.	Broker Service: which is an optional single point of entry into the microservice. So the broker will receive requests from the front end and then fire off requests and consumer responses from different microservices.

2.	Authentication Service: where we log users in and that will have a Postgres database.

3.	Logging Service: which is connected to MongoDB and that will log events from all of the other microservices.

4.	Mail Service: that sends email with one or more specific templates.

5.	Listener Service: that consumes messages from rabbit in queue and initiates a process based upon the message it receives.

We will communicate between microservices using the rest API with JSON, RPC and gRPC. Also initiate and respond to events using the Advanced Message
Queuing Protocol(AMQP) with the rabbit MQ as the back end.

Build and deployment:
Build docker image for each microservice. 
Push docker image to docker hub.
Deploy distributed application using docker swarm.
Deploy distributed application using Kubernetes.
![image](https://user-images.githubusercontent.com/30834801/209208922-23a035a2-2629-4bf9-a5da-8cdeeef24476.png)
