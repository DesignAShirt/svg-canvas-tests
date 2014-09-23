(function() {
  function getCanvas() {
    var canvas = document.createElement('canvas');
    canvas.width = canvas.height = 500;
    canvas.style.width = '100px';
    canvas.style.height = '100px';
    document.body.appendChild(canvas);
    return canvas;
  }

  function getContext(canvas) {
    return canvas.getContext('2d');
  }

  function loadImage(url, callback) {
    var img = new Image();

    img.onload = function() {
      img.onload = img.onerror = null;
      callback(null, img);
    };

    img.onerror = function() {
      callback(new Error('Unable to load url: ' + url));
    };

    // ff will always error data uris here
    if (0 === url.indexOf('http://') || 0 === url.indexOf('https://')) {
      img.crossOrigin = 'anonymous';
    }

    img.src = url;
  }

  function draw(context, img) {
    context.drawImage(img, 0, 0);
  }

  function png(canvas) {
    var png = canvas.toDataURL('image/png');
    if (0 === png.indexOf('data:image/png')) {
      return png;
    }
    else {
      throw new Error('Invalid ');
    }
  }

  window.render = function(url, callback) {
    var canvas, context;

    try {
      canvas = getCanvas();
      context = getContext(canvas);

      loadImage(url, function(err, img) {
        if (err) return callback(err);
        draw(context, img);
        callback(null, png(canvas));
      });
    }
    catch(err) {
      return callback(err);
    }
  };
})();
