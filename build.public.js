({
	//- paths are relative to this app.js file
	appDir: "app",
	baseUrl: "js",
	//- this is the directory that the new files will be. it will be created if it doesn't exist
	dir: "public",
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

	modules: [
		{
			name: "main"
		}
	],
})