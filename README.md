## Stripe Checkout : Rails 6

### Overview
[Stripe Checkout](https://stripe.com/docs/payments/checkout) creates a secure, Stripe-hosted payment page that lets you collect payments quickly. It works across all devices and is designed to increase your conversion. Checkout makes it easy to build first-class payments experiences.

This demo consists of a basic integration of the stripe prebuilt checkout with server-side code _(stripe js is no longer a requirement)_. Additionally, stripe webhooks have been incorporated to handle event data retrieved from the stripe server.

[Sendgrid](https://sendgrid.com/) has been integrated to provide email notifications to users, notifications are triggered by stripe webhook events. e.g. users are notified by email when a transaction has been completed.


`----->>>>>` [**Try the Live Demo**](https://mhulbert85-checkout.herokuapp.com/) `<<<<<-----`

#### Instructions
If you wish to clone this repository and run locally you will need to duplicate the `.env.template` file in you root directory, rename it `.env` and update the environment variables accordingly.

##### Prerequisites
- Stripe secret key
- Stripe webhook secret key
- Stripe API version : [2020-08-27](https://stripe.com/docs/upgrades#2020-08-27)
- Sendgrid api key
- Rails 6.1

#### TODO
- Manage webhooks/events e.g. alerts, browser notifications etc
- Write & optimize tests