let timer
let deleteFirstPhotoDelay


async function start(){
    try {
        const response = await fetch("https://dog.ceo/api/breeds/list/all")
        const data = await response.json()
        createBreedList(data.message)
    } catch (e) {
        console.log('Problem fetching breed list');
    }
}

start()


function createBreedList(breedList) {
    
    document.getElementById('breed').innerHTML = `
    <select onchange="loadByBreed(this.value)">
        <option>Choose a dog breed</option>
        ${Object.keys(breedList).map(function(breed){
            return `<option>${breed}</option>`
        }).join('')}
    </select>
    `
}

async function loadByBreed(breed) {
    if (breed != 'Choose a dog breed') {
        const response = await fetch(`https://dog.ceo/api/breed/${breed}/images`)
        const data = await response.json()
        createSlideshow(data.message)
    }
}

function createSlideshow(images){
    let currentImage = 0
    clearInterval(timer)
    clearTimeout(deleteFirstPhotoDelay)

    if (images.length > 1) {
        document.getElementById('slideshow').innerHTML = `
        <div class="slide" style="background-image: url('${images[0]}')"></div>
        <div class="slide" style="background-image: url('${images[1]}')"></div>
        `
    
        currentImage += 2
        if(images.length == 2) currentImage = 0
        timer = setInterval(nextSlide, 3000)
    } else {
        document.getElementById('slideshow').innerHTML = `
        <div class="slide" style="background-image: url('${images[0]}')"></div>
        <div class="slide"></div>
        `
    }

    function nextSlide(){
        document.getElementById('slideshow').insertAdjacentHTML('beforeend', `
            <div class="slide" style="background-image: url('${images[currentImage]}')"></div>`
        )
        deleteFirstPhotoDelay = setTimeout(function() {
            document.querySelector('.slide').remove()
        }, 1000)
        if (currentImage + 1 >= images.length) {
            currentImage = 0
        } else {
            currentImage++
        }
    }
} 