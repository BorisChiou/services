'use strict';

require('expose?$!expose?jQuery!jquery');
require('bootstrap/dist/css/bootstrap.css');

var redirect = require('./redirect');
var localstorage = require('./localstorage');
var hawk = require('./hawk');

var TC_KEY = 'taskclusterlogin';
var BZ_KEY = 'bugzillalogin';

// Start the ELM application
var app = require('./Main.elm').Main.fullscreen({
  taskcluster: localstorage.load_item(TC_KEY),
  bugzilla: localstorage.load_item(BZ_KEY),
});

// Setup ports
localstorage.init(app, TC_KEY);
localstorage.init(app, BZ_KEY);
hawk(app);
redirect(app);
