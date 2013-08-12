# Install

1. Clone the project: `git clone git@github.com:challengepost/reimagine.git`
2. Install dependencies: `bundle`
3. Enable SASS and CoffeeScript compilations + LiveReload: `guard`
4. Open reimagine/index.html

# Tree

```bash
. # Gemfile, Guardfile, README, configs...
└── reimagine
  ├── assets # assets, not processed.
  │ ├── javascripts # Handles .js and .coffee
  │ └── stylesheets # Handles sass, scss and css
  │ ├── application # temp: used to simulate working with reimagine in a different app
  │ └── reimagine # The reimagine.css
  ├── javascripts # processed js files go here (automatic)
  └── stylesheets # processed css files go here (automatic)
```

# Adding files

We can write our assets using preprocessors like SASS and CoffeeScript. They should be placed under `reimagine/assets`.

Compass and CoffeeScript will watch those directories and compile files as they are updated.

They are placed under `reimagine/stylesheets` and `reimagine/javascripts`. They keep the same file name (changing the extension to `.js` or `.css`) and the same tree structure.

LiveReload will tell your browser to reload when assets or html files change.

## Example

```sass
// reimagine/assets/stylesheets/helpers
@import "helpers/clearfix"

// reimagine/assets/stylesheets/helpers/_clearfix.sass
.clearfix
  &:before, &:after
    display: table;
    content: ' '
  &:after
    clear:both
  *zoom: 1
```

The file will be processed by SASS, and in the file `reimagine/stylesheets/helpers.css`.

In the HTML file, simply request `<link href="stylesheets/helpers.css">`
