

function cloneByCheck(){
  boxParent = document.querySelector('.page__show')
  checkboxes = document.querySelectorAll('input[type=checkbox]')
  checkboxes.forEach(function(checkbox){
    checkbox.addEventListener('change', function(e){
      if (e.target.checked) {
        let clone = e.target.parentNode.children[1].cloneNode(true)
        clone.classList.add('page__show__drag-and-drop')
        clone.classList.add('clone')
        boxParent.appendChild(clone)
        dragAndDrop()
      } else {
        document.querySelectorAll(`#sticker-${e.target.value}`).forEach(function(element){
          console.log(element)
          if (element.classList.contains('clone')) {
            console.log('remove')
            element.remove()
          }
        })
      }
    })
  })
}
cloneByCheck()

function dragAndDrop(){
  let elements = document.querySelectorAll('.page__show__drag-and-drop');
  let parent = elements[0].parentNode;
  console.log(parent)
  let parentInfo = parent.getBoundingClientRect();

  elements.forEach(function(drag){
    drag.addEventListener('mousedown', function(e){  
      let coord = getCoord(drag);

      console.log(`elementX:${coord.left}, boxX: ${parentInfo.left}, elementY: ${coord.top}, boxY: ${parentInfo.top}`)

      let shiftX = e.pageX - coord.left;
      let shiftY = e.pageY - coord.top;
      drag.style.position = 'absolute';
      document.body.appendChild(drag);
      moveItem(e);
      drag.style.zIndex = 1000;

      function moveItem(e) {
        drag.style.left = e.pageX - shiftX + 'px';
        drag.style.top = e.pageY - shiftY + 'px';
      }
      document.onmousemove = function(e) {
        moveItem(e);
      };
      drag.onmouseup = function() {
        document.onmousemove = null;
        drag.onmouseup = null;
      };
    })

    function getCoord(elem) {
      let main = elem.getBoundingClientRect();
      return {
        top: main.top,
        left: main.left
      };
    }
  })
}
