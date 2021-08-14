// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

import '../stylesheets/application';
import '@fortawesome/fontawesome-free/js/all';
import 'bootstrap';
// import 'easymde/dist/easymde.min.css'
// import EasyMDE from 'easymde'
import 'easymde'


Rails.start()
Turbolinks.start()
ActiveStorage.start()

$(function() {
  $('#preview').on('click',function() {
    var text = $('#md-textarea').val()
    $.ajax({  
      url: '/api/preview',
      type: 'GET',
      dataType: 'script',
      data: { body: text }
    });
  });
});

$(function() {
  $('#markdown').on('click',function() {
    $("#preview-area").addClass('d-none');
    $("#md-textarea").removeClass('d-none');
    $('#preview').addClass('bg-light-grey events-auto');
    $('#preview').removeClass('bg-white');
    $('#markdown').addClass('bg-white events-none');
    $('#markdown').removeClass('events-auto');
  });
});