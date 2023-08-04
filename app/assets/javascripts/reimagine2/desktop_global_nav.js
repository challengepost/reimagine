Reimagine2.desktopGlobalNav = function() {
  var desktopSearchContainer = $('#desktop-search-form-container');

  $('[data-toggle-desktop-search]').on('click', function(_event) {
    desktopSearchContainer.toggleClass('hide');

    if (!desktopSearchContainer.hasClass('hide')) {
      desktopSearchContainer.find('#search').focus();
    }
  });
};
