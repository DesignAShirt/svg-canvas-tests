(function() {
  function debugHeader(url) {
    var header = document.createElement('h4');
    header.style.whiteSpace = 'no-wrap';
    header.style.overflow = 'hidden';
    header.innerHTML = url;
    document.body.appendChild(header);
  }

  function getCanvas() {
    var canvas = document.createElement('canvas');
    canvas.width = canvas.height = 500;
    canvas.style.width = '100px';
    canvas.style.height = '100px';
    append('Canvas', canvas);
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

  function record(datauri) {
    var img = document.createElement('img');
    img.style.width = '100px';
    append('Image', img);
    img.src = datauri;
  }

  function append(name, el) {
    var div = document.createElement('div')
      , header = document.createElement('h5');

    header.innerHTML = name;

    div.appendChild(header);
    div.appendChild(el);

    document.body.appendChild(div);
  }

  window.render = function(url, callback) {
    var canvas, context, datauri;

    debugHeader(url);

    try {
      canvas = getCanvas();
      context = getContext(canvas);

      if (!canvas || !context) {
        return callback(new Error('Could not create canvas or get context'));
      }

      loadImage(url, function(err, img) {
        if (err) return callback(err);
        draw(context, img);
        datauri = png(canvas);
        record(datauri);
        callback(null, datauri);
      });
    }
    catch(err) {
      return callback(err);
    }
  };
})();
