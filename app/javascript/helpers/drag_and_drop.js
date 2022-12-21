function dragAndDrop() {
  let positions =[]
  let pageCardsClonesParent = document.querySelector('.page__show');
  let pageCardsClonesParentInfo = pageCardsClonesParent.getBoundingClientRect();

  function cloneByCheck(){
    boxParent = document.querySelector('.page__show')
    checkboxes = document.querySelectorAll('input[type=checkbox]')
    checkboxes.forEach(function(checkbox){
      checkbox.addEventListener('change', function(e){
        if (e.target.checked) {
          boxParent.classList.add("sticker_on_page")
          generateElements(e, boxParent)
          positions.push({id: e.target.value, x: 0, y: 0})
          dragAndDrop(e)
        } else {
          removeClone(e)
        }
      })
    })
  }
  cloneByCheck()

  function removeClone(e){
    document.querySelectorAll(`#sticker-${e.target.value}`).forEach(function(element){
      if (element.classList.contains('clone')) {
        element.remove()
        positions = positions.filter(function(item){
          return item.id != e.target.value
        })
      }
    })
  }

  function generateElements(e, boxParent){
    let clone = e.target.parentNode.children[1].cloneNode(true) 
    clone.children[1].remove()
    clone.classList.add('page__show__drag-and-drop')
    clone.classList.add('clone')
    boxParent.appendChild(clone)
    
    let inputX = document.createElement('input')
    inputX.classList.add('position-x')
    inputX.setAttribute('id', `position_x-${e.target.value}`)
    inputX.setAttribute('type', 'hidden')
    inputX.setAttribute('name', `position_x[${e.target.value}]`)
    inputX.setAttribute('value', 0)
    document.querySelector('.form__field__positions').appendChild(inputX)

    let inputY = document.createElement('input')
    inputY.classList.add('position-y')
    inputY.setAttribute('id',  `position_y-${e.target.value}`)
    inputY.setAttribute('type', 'hidden')
    inputY.setAttribute('name', `position_y[${e.target.value}]`)
    inputY.setAttribute('value', 0)
    document.querySelector('.form__field__positions').appendChild(inputY)
  }

  function dragAndDrop(){
    let pageCardsClones = document.querySelectorAll('.page__show__drag-and-drop');


    pageCardsClones.forEach(function(drag){
      drag.addEventListener('mousedown', function(e){  
        let coord = getCoord(drag);

        console.log(`elementX:${coord.left}, boxX: ${pageCardsClonesParentInfo.left}, elementY: ${coord.top}, boxY: ${pageCardsClonesParentInfo.top}`)

        let shiftX = e.pageX - coord.left;
        let shiftY = e.pageY - coord.top;
        drag.style.position = 'absolute';
        document.body.appendChild(drag);
        moveItem(e);
        drag.style.zIndex = 1000;

        function moveItem(e) {
          drag.style.left = e.pageX - shiftX + 'px';
          drag.style.top = e.pageY - shiftY + 'px';
          document.querySelector('.position__notice__x').innerHTML = `X: ${e.pageX - shiftX - pageCardsClonesParentInfo.left}`
          document.querySelector('.position__notice__y').innerHTML = `Y: ${e.pageY - shiftY - pageCardsClonesParentInfo.top}`
        }
        document.onmousemove = function(e) {
          moveItem(e);
        };
        drag.onmouseup = function() {
          document.onmousemove = null;
          drag.onmouseup = null;
        };
        
        updatePositions(drag, coord, pageCardsClonesParentInfo)
      })
    })
  }

  function updatePositions(drag, coord, pageCardsClonesParentInfo){
    document.getElementById(`position_x-${drag.id.split('-')[1]}`).value = coord.left - pageCardsClonesParentInfo.left
    document.getElementById(`position_y-${drag.id.split('-')[1]}`).value = coord.top - pageCardsClonesParentInfo.top
  }
    

  function getCoord(elem) {
    let main = elem.getBoundingClientRect();
    return {
      top: main.top,
      left: main.left
    };
  }
}
dragAndDrop()
