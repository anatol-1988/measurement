# Measurement Protocol

This package helps you to work with Google Analytics [`Measurement protocol`](https://developers.google.com/analytics/devguides/collection/protocol/v1).

## Example

Let's send `page view` event to the Google Analytics:

```elm
import Measurement as GA

GA.pageview "UA-XXXXX-Y" "555" "/home"

```

This will construct Measurement Protocol hit and send it to the `POST /collect`
endpoint. You can check your request with [Hit Builder](https://ga-dev-tools.appspot.com/hit-builder/).
