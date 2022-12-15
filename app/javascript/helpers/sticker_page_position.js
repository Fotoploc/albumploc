function stickerPagePosition() {
  let pages = document.querySelectorAll(".page_stickers__container")
  pages.forEach((page) => {
    topMultiply = percentage(page.offsetWidth, 435)
    leftMultiply = percentage(page.offsetHeight, 630)
    page.querySelectorAll(".page_stickers__card").forEach((sticker) => {
      sticker.style.top = `${sticker.style.top.split("px")[0] * topMultiply}px`
      sticker.style.left = `${sticker.style.left.split("px")[0] * leftMultiply}px`
    })
  })
  }
stickerPagePosition()

function percentage(partialValue, totalValue) {
  let result =  partialValue / totalValue
  return result.toFixed(2);;
}
