var profile = document.getElementById("menu-accountManagement");
var profileItem = document.getElementById("menu-accountManagement--item");
profile.addEventListener("click", function () {
  if (profileItem.style.height == "175px") {
    profile.style.backgroundColor = null;
    profile.style.color = null;
    profileItem.style.height = "0px";
  } else {
    profile.style.backgroundColor = "#34C759";
    profile.style.color = "#fff";
    profileItem.style.height = "175px";

    boardManagement.style.backgroundColor = null;
    boardManagement.style.color = null;
    boardManagementItem.style.height = "0px";

    boardManagement.classList.remove("selected-menu");
  }
  profile.classList.toggle("selected-menu");
});

var boardManagement = document.getElementById("menu-boardManagement");
var boardManagementItem = document.getElementById("menu-boardManagement--item");
boardManagement.addEventListener("click", function () {
  if (boardManagementItem.style.height == "70px") {
	boardManagement.style.backgroundColor = null;
	boardManagement.style.color = null;
	boardManagementItem.style.height = "0px";
  } else {
	boardManagement.style.backgroundColor = "#34C759";
	boardManagement.style.color = "#fff";
	boardManagementItem.style.height = "70px";

    profile.style.backgroundColor = null;
    profile.style.color = null;
    profileItem.style.height = "0px";

    profile.classList.remove("selected-menu");
  }
  boardManagement.classList.toggle("selected-menu");
});

