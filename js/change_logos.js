const images = document.querySelectorAll(`.alt-logo-img`)
let activeIndex = 0

document.getElementById(`logo-img-container`).addEventListener(`mouseleave`, ()=>{
	[...images].map(e => e.classList.remove(`active`))
	images[++activeIndex % images.length].classList.add(`active`)
})
