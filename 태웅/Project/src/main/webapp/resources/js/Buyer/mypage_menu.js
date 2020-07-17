var profile = document.getElementById("menu-profile");
var profileItem = document.getElementById("menu-profile--item");
profile.addEventListener("click", function () {
  if (profileItem.style.height == "105px") {
    profile.style.backgroundColor = null;
    profile.style.color = null;
    profileItem.style.height = "0px";
  } else {
    profile.style.backgroundColor = "#34C759";
    profile.style.color = "#fff";
    profileItem.style.height = "105px";

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

var myShopping = document.getElementById("menu-myShopping");
var myShoppingItem = document.getElementById("menu-myShopping--item");
myShopping.addEventListener("click", function () {
  if (myShoppingItem.style.height == "140px") {
    myShopping.style.backgroundColor = null;
    myShopping.style.color = null;
    myShoppingItem.style.height = "0px";
  } else {
    myShopping.style.backgroundColor = "#34C759";
    myShopping.style.color = "#fff";
    myShoppingItem.style.height = "140px";

    profile.style.backgroundColor = null;
    profile.style.color = null;
    profileItem.style.height = "0px";
    qna.style.backgroundColor = null;
    qna.style.color = null;
    qnaItem.style.height = "0px";

    profile.classList.remove("selected-menu");
    qna.classList.remove("selected-menu");
  }
  myShopping.classList.toggle("selected-menu");
});

var qna = document.getElementById("menu-qna");
var qnaItem = document.getElementById("menu-qna--item");
qna.addEventListener("click", function () {
  if (qnaItem.style.height == "70px") {
    qna.style.backgroundColor = null;
    qna.style.color = null;
    qnaItem.style.height = "0px";
  } else {
    qna.style.backgroundColor = "#34C759";
    qna.style.color = "#fff";
    qnaItem.style.height = "70px";

    profile.style.backgroundColor = null;
    profile.style.color = null;
    profileItem.style.height = "0px";
    myShopping.style.backgroundColor = null;
    myShopping.style.color = null;
    myShoppingItem.style.height = "0px";

    profile.classList.remove("selected-menu");
    myShopping.classList.remove("selected-menu");
  }
  qna.classList.toggle("selected-menu");
});
