const dom = {}

function getProductIds(){
  const products = document.querySelectorAll('.product-listing')
  return Array.from(products).map((el) => el.dataset.productId)
}

function replaceProductComingSoon(productId, sizeHtml){
  const name = `.product-soon-${productId}`
  const productSoonEls = document.querySelectorAll(name)

  productSoonEls.forEach((el) => {
    const fragment = document.createRange().createContextualFragment(sizeHtml)
    el.replaceWith(fragment)
  });
}

function updateItemLevel(itemId, level){
  Array.from(document.querySelectorAll('.size-container__entry')).
    filter((el) => el.value == itemId).
    forEach((el) => {
      removeStockLevelClasses(el)
      el.classList.add(`size-container__entry--level-${level}`)
      el.disabled = level === "out"
    });
}

function removeStockLevelClasses(el){
  Array.from(el.classList).
    filter((e) => s.startsWith("size-container__entry--level-")).
    forEach((name) => el.classList.remove(name))
}

dom.getProductIds = getProductIds
dom.replaceProductComingSoon = replaceProductComingSoon
dom.updateItemLevel = updateItemLevel

export default dom
