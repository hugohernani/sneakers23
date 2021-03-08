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

dom.getProductIds = getProductIds
dom.replaceProductComingSoon = replaceProductComingSoon

export default dom
