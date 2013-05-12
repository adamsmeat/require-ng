# require-ng

A frontend template for projects that require AngularJS handled by RequireJS.

This was supposed to work with Yeoman and Bower but I decided to not use them at the moment. GruntJS
is used though to manage tasks(tasks that may also do project template generation).

Yeoman is simply a generator for your frontend application. This is great if your app is too dependent on
node.js. Since we are using PHP, all I needed to do is just create a folder that contains project
templates(common less files, css, js, etc.) Just use Grunt's copy task to bring them over to your project folder.

Bower is for package management. In node.js, people are yet competing on which is the best project that is able
to solve this issue. I really feel like PHP composer is good enough even for assets. Just look at what Laravel 4 has done.
Artisan is able to publish your public folder from your own package. In all fairner, Bower is concerned with Components.
Most of the time you can handle this by having the git repo of a project, say jquery, angular etc, save them in a vendor
folder which is nothing else but just a collection of git repos. Get your components from there. This way, you can 
easily get the latest version.

# Usage

### Dev environment

In your project folder, symlink your template(project generator) folder and vendor(git repos) for easy access. In your
job, make sure to create/add a template if you think you might need something similar in the future.

If you look closely to my Gruntfile, the task: generate-template is just copying a template from my symlinked generator/projects
folder.

This will create an app folder in your root. Use this app folder for developing. Later, add your tests.

### Production

Whenever a milestone is reached, run grunt task: publish which will build(for now, its just uglify), your public folder on same level
as your app. Everything that was there will be overwritten. Worry not, because for each publish task, it creates a timestamped public folder.

Always build using grunt.

# Goal

Show how to modularize Angular projects neatly through RequireJS.