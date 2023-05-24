//= require rails-ujs
//= require turbolinks
//= require jquery3
//= require popper
//= require bootstrap
//= require_tree .
//= require bootstrap-select

$(document).on('turbolinks:load', function() {
    const $picker = $('.selectpicker').selectpicker({
        noneSelectedText : 'Wybierz coś...'
    });
    const picker = $picker.data('selectpicker');
    if (picker) {
        picker.destroy();
        $picker.addClass('selectpicker');
    }
    $('*:not(.bootstrap-select) > .selectpicker').selectpicker('refresh');
});