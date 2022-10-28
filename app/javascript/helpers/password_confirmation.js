const passwordConfirmationField = document.getElementById("form__field__password__confirmation");
const passwordField = document.getElementById("form__field__password");

passwordConfirmationField.addEventListener("input", function() {
  if (passwordConfirmationField.value !== passwordField.value) {
    passwordConfirmationField.setCustomValidity("Passwords do not match");
    document.querySelector("#form__action__submit").disabled = true;
    document.getElementById("password_confirmation").innerHTML = passwordConfirmationField.validationMessage;
  } else {
    passwordConfirmationField.setCustomValidity("");
    document.querySelector("#form__action__submit").disabled = false;
    document.getElementById("password_confirmation").innerHTML = "";
  }
});
