## Install

**TBD**

## Styleguide

In order to make the guide easily accessible, it needs to be deployed to Heroku

### Update confituration

    git remote add heroku git@heroku.com:cpstyleguide.git

### Push to "production"

    git push heroku master

#### Update gem

* Update the version file

  `lib/reimagine2/vesion.rb`

* Deploy to Gemfury

  `rake deploy`

### Access the styleguide at

    http://cpstyleguide.challengepost.com

### Local environment

    bundle
    forman start
