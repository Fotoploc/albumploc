let drag = document.querySelector('.drag_and_drop');
let parent = drag.parentNode;
let parentInfo = parent.getBoundingClientRect();
drag.onmousedown = function(e) {
  let coord = getCoord(drag);

  document.getElementById('escreva__aqui').innerHTML = `X:${coord.left - parentInfo.left} Y: ${coord.top - parentInfo.top}`

  console.log(`elementX:${coord.left}, boxX: ${parentInfo.left}, elementY: ${coord.top}, boxY: ${parentInfo.top}`)

  let shiftX = e.pageX - coord.left;
  let shiftY = e.pageY - coord.top;
  drag.style.position = 'absolute';
  document.body.appendChild(drag);
  moveNote(e);
  drag.style.zIndex = 1000;

  function moveNote(e) {
    drag.style.left = e.pageX - shiftX + 'px';
    drag.style.top = e.pageY - shiftY + 'px';
  }
  document.onmousemove = function(e) {
    moveNote(e);
  };
  drag.onmouseup = function() {
    document.onmousemove = null;
    drag.onmouseup = null;
  };
}

function getCoord(elem) {
  let main = elem.getBoundingClientRect();
  return {
    top: main.top,
    left: main.left
  };
}
