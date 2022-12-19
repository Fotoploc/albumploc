function refreshPage() {
  let signout = document.getElementById('signout-button')
  signout.addEventListener('click', () => {
    setTimeout(() => {
      location.reload()
    }, 1000)
  })
}
refreshPage()
