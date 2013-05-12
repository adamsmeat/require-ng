requirejs.config({

    baseUrl: 'js',

    paths: {
        //standard lib includes
        modernizr: 'lib/modernizr-2.6.2',
        'angular-loader': 'lib/angular-loader-1.1.4', //seems not necessary
        less: 'lib/less-1.3.3',        
        jquery: 'lib/jquery-2.0.0', //does not need export
        bootstrap: 'lib/bootstrap-2.3.1',
        underscore: 'lib/underscore-1.4.4',
        angular: 'lib/angular-1.1.4',
        'coffee-script': 'lib/coffee-script-1.6.2',

        text: 'plugin/text-2.0.6',  
        cs: 'plugin/cs-0.4.3',  

        partial: '../partial',
    },   

    shim: {
        bootstrap: {deps:['jquery']},
        less: {exports: 'less'},
        underscore: {exports: '_'},
        angular: {deps:['angular-loader'], exports: 'angular'},
        modernizr: {exports: 'Modernizr'},
    },   

    urlArgs: 'bust='+ new Date().getTime(),

    someInit: (function(){
        less = {
            env: "development", // or "production"
            async: false,       // load imports async
            fileAsync: false,   // load imports async when in a page under
                                // a file protocol
            poll: 1000,         // when in watch mode, time in ms between polls
            functions: {},      // user functions, keyed by name
            dumpLineNumbers: "comments", // or "mediaQuery" or "all"
            relativeUrls: false,// whether to adjust url's to be relative
                                // if false, url's are already relative to the
                                // entry less file
            //rootpath: "http://ng/new/"// a path to add on to the start of every url resource
        }        
    })()    
});

//remove less if not in dev mode, affix the overall css
requirejs(['cs!my/tpl', 'cs!my/app'], function (tpl, app) {
    "use strict";
    console.info('Initializing...');
    console.log(
        'tpl:', tpl,
        'app:', app        
    );
});