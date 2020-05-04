document.querySelector("#databaseForm").addEventListener("submit", getData);

function getData(e){
    const data = document.querySelector(".data").value;

    console.log(data);

    e.preventDefault();
}


