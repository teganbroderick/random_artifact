# A Random Artifact
This app shares information about random artifacts from the [Victoria and Albert Museum](https://www.vam.ac.uk). A user can view information in a web browser, or text a phone number to receive information via sms.

## Tech Stack
Ruby, Ruby on Rails, React, HTML, CSS <br>
APIs: [The V&A Collections API](https://developers.vam.ac.uk), [IIIF Image API 3.0](https://iiif.io/api/image/3.0/), [Twilio Programmable Messaging API](https://www.twilio.com/messaging-api)

## Run This App on Your Local Computer
#### Web Application <br>
Clone or fork repository:
```
$ git clone https://github.com/teganbroderick/random_artifact.git
```
Change directories:
```
cd random_artifact
```
Install dependencies:
```
yarn install
```
Start the server:
```
rails server
```
Navigate to http://localhost:3000/ in your browser to view the app.

#### SMS Feature <br>
Set up a Twilio account and configure your Twilio number. Follow the steps in [this tutorial](https://www.twilio.com/blog/2016/04/receive-and-reply-to-sms-in-rails.html) to add your credentials to `credentials.yml.enc` and set up `ngrok`. You should now be able to text your Twilio number and receive artifact information on your phone when the rails server is running.

## Features
#### Web Application <br>
The index page displays information about a random artifact from the V&A Museum collection. A different random artifact is displayed each time the page is loaded.<br>
![random_artifacts3_trimmed](https://user-images.githubusercontent.com/31426739/137669782-534ebd73-501d-4c83-8f1a-28527554d073.gif)

#### SMS Feature <br>
A user can text a phone number to receive information about a random artifact via sms. A different random artifact is sent each time.<br>
<img src="https://user-images.githubusercontent.com/31426739/137668558-8051f97a-25b2-4457-970a-0ed185ab3a67.png" data-canonical-src="https://gyazo.com/eb5c5741b6a9a16c692170a41a49c858.png" width="40%" height="40%" />

## About This Project
I made this in October, 2021 to explore museum collection APIs and learn more about Twilio APIs. I worked in museums for a decade before becoming a software engineer, and I wanted to build something that could surface information about collection items. I haven't visited a museum since the pandemic started, and I miss seeing random artifacts in person.<br>

The app was rebuilt in January, 2023 using Rails 7, esbuild, and React on the frontend.
