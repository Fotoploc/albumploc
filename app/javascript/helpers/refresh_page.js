function refreshPage() {
  let signout = document.getElementById('signout-button')
  signout.addEventListener('click', () => {
    setTimeout(() => {
      location.reload()
      console.log('Page refreshed')
    }, 1000)
  })
}
refreshPage()
