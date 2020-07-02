var sendAtNum = document.querySelector(".sendAtNum-btn"),
  Authentication = document.querySelector(".Authentication");

sendAtNum.addEventListener("click", function () {
  Authentication.style.display = "flex";
});

var allCheck = document.getElementById("agreementAll"),
  checkBoxLength = document.getElementsByClassName(".chkBox").length;

allCheck.addEventListener("click", function () {});

function check_all() {
  for (var i = 0; i < checkBoxLength; i++) {
    checkBoxLength[i].checked;
  }
}
