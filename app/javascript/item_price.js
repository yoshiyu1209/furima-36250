window.addEventListener('load', () => {
  console.log("OK");

  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    console.log(inputValue);

    const addTaxDom = document.getElementById("add-tax-price");
      const commission = (Math.floor(inputValue * 0.1));
      console.log(commission)
      addTaxDom.innerHTML = (Math.floor(commission));
      console.log(addTaxDom)

      const addGainDom = document.getElementById("profit");
      const gain = (Math.floor(inputValue * 0.1));
      console.log(gain)
      addGainDom.innerHTML = (Math.floor(inputValue - gain));
        console.log(addGainDom)
  })

});


