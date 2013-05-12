module.exports = (grunt) ->

	remove_version_numbers = (dest, src) ->
		return dest + src.replace(/-\d+(.\d+)+/, '')

	# creates a nice temp folder
	timestamped_public_dir_cached = null
	timestamped_public_dir = () ->
		if (timestamped_public_dir_cached isnt null)
			return timestamped_public_dir_cached
		d = new Date()
		return  timestamped_public_dir_cached = 'public_' +(d.toDateString()+'_'+ d.toLocaleTimeString()).replace(/(:|-|\s)/g, '.')		

	grunt.initConfig(

		pkg: grunt.file.readJSON('package.json')

		copy:

			#some kind of generator
			template:
				files: [
					{expand: true , cwd: 'generator', src: ['css/*', 'img/*', 'js/**', 'less/**', 'partial/**', '*'], dest: 'app/'}
				]

			app_to_public:
				files: [
					#standard libs, plugins and my modules
					{expand: true , cwd: 'app/js/lib', src: ['*.js'], dest: timestamped_public_dir()+'/js/', filter: 'isFile', rename: remove_version_numbers}
					{expand: true , cwd: 'app/js/plugin', src: ['*.js'], dest: timestamped_public_dir()+'/js/', filter: 'isFile', rename: remove_version_numbers}
					{expand: true , cwd: 'app/js/my', src: ['*'], dest: timestamped_public_dir()+'/js/my/', filter: 'isFile', rename: remove_version_numbers}

					{expand: true , cwd: 'app', src: ['css/*', 'img/*', 'partial/**', 'less/**'], dest: timestamped_public_dir()+'/'}
					{expand: true , cwd: 'app', src: ['*'], dest: timestamped_public_dir()+'/', filter: 'isFile'}

					# use standard public index and main referencing the unversioned main and require file
					{expand: true , cwd: 'generator/public/js', src: ['main.js'], dest: timestamped_public_dir()+'/js/'}					
					{expand: true , cwd: 'generator/public', src: ['index.html'], dest: timestamped_public_dir()+'/'}					
				]				

		requirejs:
			dist:
			  #// Options: https://github.com/jrburke/r.js/blob/master/build/example.build.js
				options:
					appDir: timestamped_public_dir()
					baseUrl: 'js'
					dir: 'public'
					#mainConfigFile: 'app/js/main.js'
					paths:
						'partial': '../partial'

					shim:
						bootstrap: {deps:['jquery']}
						less: {exports: 'less'}
						underscore: {exports: '_'}
						angular: {deps:['angular-loader'], exports: 'angular'}
						modernizr: {exports: 'Modernizr'}

					modules: [
						{name: "main"}
					]

					keepBuildDir: true
					optimize: "uglify2"
					optimizeCss: "none"
					cssImportIgnore: null
					#cssIn: "path/to/main.css"
					#out: "path/to/css-optimized.css"
					inlineText: true
					#useStrict: false
					preserveLicenseComments: false
					#wrap: true
	)

	grunt.loadNpmTasks('grunt-contrib-copy')
	grunt.loadNpmTasks('grunt-contrib-requirejs')

	grunt.registerTask('default', [])
	grunt.registerTask('generate-template', ['copy:template'])
	grunt.registerTask('publish', ['copy:app_to_public', 'requirejs'])
