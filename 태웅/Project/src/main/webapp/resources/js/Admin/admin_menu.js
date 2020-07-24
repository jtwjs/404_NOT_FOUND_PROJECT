var profile = document.getElementById("menu-accountManagement");
var profileItem = document.getElementById("menu-accountManagement--item");
profile.addEventListener("click", function () {
  if (profileItem.style.height == "140px") {
    profile.style.backgroundColor = null;
    profile.style.color = null;
    profileItem.style.height = "0px";
  } else {
    profile.style.backgroundColor = "#34C759";
    profile.style.color = "#fff";
    profileItem.style.height = "140px";

    myShopping.style.backgroundColor = null;
    myShopping.style.color = null;
    myShoppingItem.style.height = "0px";

    qna.style.backgroundColor = null;
    qna.style.color = null;
    qnaItem.style.height = "0px";

    myShopping.classList.remove("selected-menu");
    qna.classList.remove("selected-menu");
  }
  profile.classList.toggle("selected-menu");
});
