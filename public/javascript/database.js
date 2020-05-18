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
        tab_links[i].className = tab_links[i].className.replace('is-active',' ')
        
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

// ----------------------------DELETE ROW----------------------------
$(document).on('click', '.delete', function(event) {
    event.preventDefault()

    var element = $(this)
    var table = document.getElementById('insert_table_select')
    var name = element.attr('data-name')
    var number = element.attr('data-id')

    $.ajax({
        type:'delete',
        url: `/database/delete/${table.value}/${name}/${number}`,
        success: function(status) {
            if (status.worked == 'false') {
                alert('Delete Failed, SQL Error Code: ' + status.message )

            } else {
                element.closest('tr').hide(200)
            }
        }
    })
    return false;
})





// ----------------------------AJAX TABLE DISPLAYER----------------------------
// var btn = document.getElementById("btn");
$('#insert_table_select').on('change', function() {
    var table = $(this).val()

    var ourRequest = new XMLHttpRequest();
    ourRequest.open('GET', `/database/retrieve/${table}`)
    ourRequest.onload = function() {
    if (ourRequest.status >= 200 && ourRequest.status < 400) {
        var ourData = JSON.parse(ourRequest.responseText);
        renderTable(ourData);
    } else {
        console.log("We connected to the server, but it returned an error.");
    }
    
    };

    ourRequest.onerror = function() {
        console.log("Connection error");
    };

    ourRequest.send();

    function renderTable(data) {
        // thead
        var tableKeys = Object.keys(data[0])
        var columnsString = ''
        for (i = 0; i < tableKeys.length; i++) {
            columnsString += "<th>" + tableKeys[i] + "</th>"
        }
        columnsString += '<th>Edit</th> <th>Delete</th>'              

        // td rows
        var tableData = ''
        for (i = 0; i < data.length; i++) {
            tableData += '<tr>'
            for (j = 0; j < tableKeys.length; j++){
                
                tableData += '<td>' + data[i][tableKeys[j]] + '</td>'
            }
            tableData += `\
                <td>\
                    <a href="">Edit</a>\
                </td>\
                <td>\
                    <button class=\'button delete is-danger is-light is-outlined\' \
                        data-name=\'${tableKeys[0]}\' data-id=\'${data[i][tableKeys[0]]}\'
                    >\
                    </button>\
                </td>\
                `

            tableData += '</tr>'
        }

        // html for the table_container div
        document.getElementById("table_container").innerHTML = `
        <div class="block">
            <table class="table is-striped">

                <thead>
                    <tr>
                        ${columnsString}
                    </tr>
                </thead>

                <tbody>
                        ${tableData}
                </tbody>

            </table>
        </div>    
        `
    }
})

// ----------------------------AJAX HANDLEBAR TEMPLATE GETTER----------------------------
//  not using right not but may come in handy later
// var table = ''
// var tableButtonTest = document.getElementById("tableButtonTest")

// tableButtonTest.addEventListener('click', function() {

//     var tableRequest = new XMLHttpRequest()
//     tableRequest.open('GET', `/database/retrieve${table}`)
//     tableRequest.onload = function(){
//         if (tableRequest.status >= 200 && tableRequest.status < 400) {
//             var data = JSON.parse(tableRequest.responseText)
//             path = (`/database/show${table}`)
//             getTemplateAjax(path)
//         } else {
//             console.log("Connected to server but error returned")
//         }
//     }

//     tableRequest.onerror = function() {
//         console.log("connection error")
//     }

// tableRequest.send()
// })

// function getTemplateAjax(path) {
//     var source;
//     var template;

//     $.ajax({
//         url: path,
//         cache: true,
//         success: function(data) {
//             source    = data;
//             template  = Handlebars.compile(source);
//             $('#table_container').html(template);
//         }               
//     });         
// }
