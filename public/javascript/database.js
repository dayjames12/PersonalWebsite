// ----------------------------FORM DROP DOWN SELECTOR----------------------------
// used helpful answer from Simon on stackoverflow https://stackoverflow.com/questions/11959889/show-hide-different-forms-based-on-a-option-selected
// jquery to select different forms from dropdown menu to select proper fields to insnert per table 
$("#insert_table_select").on("change", function() {
    // show selected table and hide all others
    $("#" + $(this).val()).show().siblings().hide()
    // show the table drop down form 
    $("#insert_table_form").show()  
})

// ----------------------------TAB SWITCHER----------------------------
function openTab(event, tabID) {
    // hide all class tab_content 
    tab_content = document.getElementsByClassName('tab_content')
    for (i = 0; i < tab_content.length; i++) {
        tab_content[i].style.display = 'none'
    }

    // remove is-active from class tab_links
    tab_links = document.getElementsByClassName('tab_links')
    for (i = 0; i < tab_links.length; i++) {
        tab_links[i].className = tab_links[i].className.replace(' is-active',' ')
        
    }

    // show current tab by adding is-active to the tab_link
    document.getElementById(tabID).style.display = 'block'
    event.currentTarget.className += " is-active"
}

// ----------------------------FORCING INPUT TO CAPS----------------------------
// help from https://www.the-art-of-web.com/html/input-field-uppercase/
function forceUpperCase(event){
    var start = event.target.selectionStart
    var end = event.target.selectionEnd
    event.target.value = event.target.value.toUpperCase()
    event.target.setSelectionRange(start, end)
}

// ----------------------------AJAX TABLE DISPLAYER----------------------------
var table = 'car'
var tableButtonTest = document.getElementById("tableButtonTest")

tableButtonTest.addEventListener('click', function() {

    var tableRequest = new XMLHttpRequest()
    tableRequest.open('GET', `/database/retrieve${table}`)
    tableRequest.onload = function(){
        if (tableRequest.status >= 200 && tableRequest.status < 400) {
            var data = JSON.parse(tableRequest.responseText)
            path = (`/database/show${table}`)
            getTemplateAjax(path)
        } else {
            console.log("Connected to server but error returned")
        }
    }

    tableRequest.onerror = function() {
        console.log("connection error")
    }

tableRequest.send()
})

function getTemplateAjax(path) {
    var source;
    var template;

    $.ajax({
        url: path,
        cache: true,
        success: function(data) {
            source    = data;
            template  = Handlebars.compile(source);
            $('#table_container').html(template);
        }               
    });         
}



var table_container = document.getElementById("animal-info");
var btn = document.getElementById("btn");

btn.addEventListener("click", function() {
    var ourRequest = new XMLHttpRequest();
    tableRequest.open('GET', `/database/retrieve${table}`)
    ourRequest.onload = function() {
    if (ourRequest.status >= 200 && ourRequest.status < 400) {
        var ourData = JSON.parse(ourRequest.responseText);
        renderHTML(ourData);
    } else {
        console.log("We connected to the server, but it returned an error.");
    }
    
    };

    ourRequest.onerror = function() {
        console.log("Connection error");
    };

    ourRequest.send();

    function renderHTML(data) {
        var tableKeys = Object.keys(tableData[0])
        var columnsString = ''

        for (i = 0; i < tableKeys.length; i++) {
            columnsString += "<th>" + tableKeys[i] + "<th>"
        }

        table_container.innerHTML = `
        <div class="block">
        <table class="table is-striped">

            <thead>
                <tr>
                    ${columnsString}
                </tr>
            </thead>

            <tbody>
                <tr>
                    <th>1</th>
                    <th>1234567</th>
                    <th>10000</th>
                    <th>2</th>
                </tr>  
            </tbody>

        </table>
        </div>    
        `
    }

}