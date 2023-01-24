// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
 //  console.log(priceInput)
   priceInput.addEventListener("input", () => {
     const addTaxDom = document.getElementById("add-tax-price");
     // console.log(priceInput.innerHTML);
     addTaxDom.innerHTML = Math.round(priceInput.value * 0.1 );
     const addPofitDom = document.getElementById("profit");
     // console.log(priceInput.innerHTML);
     addPofitDom.innerHTML = Math.round(priceInput.value - Math.round(priceInput.value * 0.1 ))
 })
});

require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


