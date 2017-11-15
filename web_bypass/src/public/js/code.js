function submitCode() {
  debugger;
  if ($('input#username').val() === 'root') {
    $('div#username-output').text("No you're not!");
    return false;
  } else {
    return true;
  }
}