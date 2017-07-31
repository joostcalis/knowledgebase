function markdown(id) {
  var simplemde = new SimpleMDE({
    element: document.getElementById(id)
  });

  simplemde.render();
}
