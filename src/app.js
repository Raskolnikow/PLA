import $ from 'jquery';
import pla from './pla';

$('document').ready(function() {
    $.ajax({
        type: "POST",
        url: "/Home/Index",
        dataType: "json",
        
        success: function(data) {
            pla.fill(data);
        },

        error: function(ll, textStatus, errorThrown) {
            console.log(errorThrown);
        }
    });
});