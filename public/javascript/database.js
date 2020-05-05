// document.querySelector("#databaseForm").addEventListener("submit", getData);

// function getData(e){
//     const data = document.querySelector(".data").value;

//     console.log(data);

//     e.preventDefault();
// }


// used helpful answer from Simon on stackoverflow https://stackoverflow.com/questions/11959889/show-hide-different-forms-based-on-a-option-selected
// jquery to select different forms from dropdown menu to select proper fields to insnert per table 
$("#insert_table_select").on("change", function() {
    $("#" + $(this).val()).show().siblings().hide()
})

