import $ from 'jquery';

var pla = {
    
    fill: function(data) {
        // table head
        let dd = "<table class='table'><thead><tr>";

        Object.keys(data[0]).forEach(function(key) {
            dd += "<th>" + key.toUpperCase(); + "</th>";
        });

        dd += "</tr></thead>";

        // table body
        dd += "<tbody>"
        for(var i=0; i<data.length; i++) {
            dd += "<tr>";
            Object.keys(data[i]).forEach(function(key) {
                dd += "<td>" + data[i][key] + "</td>";
            });
            dd += "</tr>";
        };
        dd += "</tbody></table>"; 

        $('#content').append(dd);
    }
};

export default pla;