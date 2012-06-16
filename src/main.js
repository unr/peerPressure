require({
    paths: {
        text: 'require-plugins/text',
        cs: 'require-plugins/cs',
        tpl: 'require-plugins/tpl',
        order: 'require-plugins/order',
        domReady: 'require-plugins/domReady',
        jquery: 'lib/jquery',
        underscore: 'lib/underscore',
        backbone: 'lib/backbone'
    }
  }, [
    //dependancies
    'jquery',
    'order!underscore',
    'order!backbone',
    'cs!bootstrap'
  ]
);
