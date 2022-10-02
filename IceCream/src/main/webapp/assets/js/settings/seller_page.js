var acc = document.getElementsByClassName("");

for (let i = 0; i < acc.length; i++) {
  acc[i].addEventListener("click", function() {
    for (let j = 0; j < acc.length; j++) {
    acc[j].classList.remove("active");
      if(j!=i){
        acc[j].nextElementSibling.style.maxHeight = null;
      }
    }
    this.classList.add("active");
    var panel = this.nextElementSibling;
    if (panel.style.maxHeight){
      panel.style.maxHeight = null;
      this.classList.remove("active");
    } else {
      panel.style.maxHeight = panel.scrollHeight + "px";

    }
  });
}
