FormStorage = {
  bind: function(form) {
    [].forEach.call(form.querySelectorAll('input, textarea'), function(input) {
      // Return early for inputs we don't want
      if (["submit"].indexOf(input.getAttribute('type')) > -1)
        return;

      var key = input.getAttribute('name') || input.getAttribute('id'); // LocalStorage key

      input.value = localStorage.getItem(key); // Set the value at load

      input.addEventListener('input', function(ev) {
        var val = input.value;

        if (input.validity.valid == true || val == '')
          localStorage.setItem(key, input.value); // Store the change
      });

    });
  }
};

!function() {
  var form = document.querySelector('form');

  if (form != undefined)
    FormStorage.bind(form);
}(FormStorage);