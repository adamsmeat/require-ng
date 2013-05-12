define ['modernizr', 'my/less', 'jquery', 'my/bootstrap',  'text!partial/navbar.html'], (modernizr, myLess, $, myBootstrap, navbar) ->
	'use strict'

	# remove my/less if you are not doing dynamic render
	$('body').prepend $(navbar).hide().fadeIn 'slow'