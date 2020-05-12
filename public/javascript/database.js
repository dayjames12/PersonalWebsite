
// FORM DROP DOWN SELECTOR
// used helpful answer from Simon on stackoverflow https://stackoverflow.com/questions/11959889/show-hide-different-forms-based-on-a-option-selected
// jquery to select different forms from dropdown menu to select proper fields to insnert per table 
$("#insert_table_select").on("change", function() {
    // show selected table and hide all others
    $("#" + $(this).val()).show().siblings().hide()
    // show the table drop down form 
    $("#insert_table_form").show()  
})

// TAB SWITCHER
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


// FORCING INPUT TO CAPS
// help from https://www.the-art-of-web.com/html/input-field-uppercase/
function forceUpperCase(event){
    var start = event.target.selectionStart
    var end = event.target.selectionEnd
    event.target.value = event.target.value.toUpperCase()
    event.target.setSelectionRange(start, end)
}