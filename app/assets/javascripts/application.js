// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery_nested_form
//= require jquery-ui.min
//= require bootstrap-datepicker
//= require bootstrap-datepicker.ru.js
//= require jquery.raty.js
//= require jquery.infinitescroll.js
//= require twitter/bootstrap
//= require bootstrap-switch.js
//= require load-image.js
//= require main.js
// require jquery.turbolinks
// require turbolinks
//= require_tree .

$('#comment_rating').raty({
    scoreName: 'comment[rating]',
    scoreId: 'comment_rating',
    path: '/assets',
    starOn: 'star_activ.png',
    starHalf: 'half_star_activ.png',
    starOff: 'star_inactiv.png',
    hints: ['Жуть', "Плохо", 'Хорошо', 'Очень хорошо', 'Отлично'],
    target: '#hint',
    targetText: 'Оценка цена / качество.',
    targetKeep: true,
    width: '123px'
});
