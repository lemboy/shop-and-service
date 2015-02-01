function showBadges() {
  prodCounterExist = document.getElementById('product_count');
  if (prodCounterExist) {prodCounterExist.innerHTML = sessvars.listid.length?sessvars.listid.length:""};
}

$(document).ready(function() {$(".cb_save_state").click(function() {
  if (this.checked) {
    list.push(this.id);
  } else {
    list.splice(list.indexOf(this.id), 1);
  }
//  document.getElementById('demo').innerHTML = list;
  sessvars.listid = list;
  showBadges();
})});

$(document).ready(function() {
  list=sessvars.listid?sessvars.listid:[];
  for (index = 0; index < list.length; index++) {
      cbxExist = document.getElementById(list[index]);
      if (cbxExist) {cbxExist.checked = true}
  }
  showBadges();
});
