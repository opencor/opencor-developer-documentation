// Resize our code elements once our page is loaded and whenever our window
// gets resized

$(document).ready(function() {
    resizeCodeElements();
});

$(window).resize(function() {
    resizeCodeElements();
});

// Resize our code elements

function resizeCodeElements() {
    $("table.highlighttable > tbody > tr > td.code > div.highlight > pre").each(function() {
        $(this).width( $("body").width()
                      -$(this).position().left
                      +parseInt($(this).css("border-right"))
                      -parseInt($(this).css("margin-right")));
    });
}

// Copyright information

function copyright(relativePath) {
    var date = new Date();

    document.write("<div class=\"copyright\">\n");
    document.write("    <div class=\"left\">\n");
    document.write("        Copyright 2011-"+date.getFullYear()+"\n");
    document.write("    </div>\n");
    document.write("    <div class=\"center\">\n");
    document.write("        <a class=\"copyright\" href=\"https://twitter.com/TeamOpenCOR/\"><img class=\"twitter\" src=\""+relativePath+"/twitter.png\" width=30 height=30></a>\n");
    document.write("    </div>\n");
    document.write("    <div class=\"right\">\n");
    document.write("        <a class=\"copyright\" href=\"http://www.virtualrat.org/\"><img class=\"vpr\" src=\""+relativePath+"/vpr.png\" width=60 height=18></a>\n");
    document.write("    </div>\n");
    document.write("</div>\n");
}
