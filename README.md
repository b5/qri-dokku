# qri-dokku

A dockerfile and documentation for running a [qri](https://qri.io) instance as a [dokku](http://dokku.viewdocs.io/dokku/) app.

## Background

The original goal was to provide a way to automate the update of a qri dataset.  Using qri on the CLI or desktop generally means running it on a personal computer.  Automating a dataset update, say appending a row every hour, requires the machine to always be on/available for an automation script to interact with.

Because qri comes with a built-in http server we can simply run it in the cloud and interact with it via http.  

## Setup

Running qri on dokku is as simple as creating a new dokku app, mapping a volume so that the app can persist data, setting up a qri user, and adding a domain name.

1. Create a new dokku app

SSH into your dokku server and create a new dokku app.  I have been choosing names prefixed with `qri-` that can also serve as the app's subdomain on the primary domain I use on my dokku server.  

`dokku apps:create qri-test`

2. Map a volume

`dokku storage:mount qri-test /root/qri-profiles/qri-test:/root/.qri`

3. Push this repo

`git remote add dokku dokku@{host}:{appname}`
`git push dokku master`

4.




## Using with Qri Desktop

Behind the scenes qri desktop is already communicating with a local qri service over http.  This usually happens at `http://localhost:2503`.  By performing a find/replace and substitiding the FQDN of a qri-dokku service, you can run Qri Desktop in dev mode and interact with the cloud qri instance instead of a local one.
