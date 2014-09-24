describe('in and out', function() {
  function renderUrl(url, done) {
    expect(function() {
      render(url, function(err, datauri) {
        if (err) throw err;
        expect(datauri.indexOf('data:')).toBe(0);
        done();
      });
    }).not.toThrow();
  }

  describe('relative', function () {
    it('pngs', function(done) {
      renderUrl('/assets/designashirt.png', done);
    });

    it('svgs', function(done) {
      renderUrl('/assets/publicdomain.svg', done);
    });
  });

  describe('cross-origin', function () {
    it('pngs', function(done) {
      renderUrl('https://s3.amazonaws.com/engineering.designashirt.com/oss/tests/svg/designashirt.png', done);
    });

    it('svgs', function(done) {
      renderUrl('https://s3.amazonaws.com/engineering.designashirt.com/oss/tests/svg/publicdomain.svg', done);
    });
  });

  describe('data uris', function () {
    var svgDoc = '<svg width="400" height="400" viewPort="0 0 400 400" version="1.1" xmlns="http://www.w3.org/2000/svg"><rect x="10" y="10" width="390" height="390"/></svg>';
    var svg = 'data:image/svg+xml;base64,' + window.btoa(unescape(encodeURIComponent(svgDoc)));
    var png = 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAOQAAABBCAMAAAD2WPjiAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyRpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMC1jMDYxIDY0LjE0MDk0OSwgMjAxMC8xMi8wNy0xMDo1NzowMSAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNS4xIE1hY2ludG9zaCIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDoxQzRBRkQwMEE2M0QxMUUzQjRFODg2MjNBQjJENUUzNCIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDoxQzRBRkQwMUE2M0QxMUUzQjRFODg2MjNBQjJENUUzNCI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSJ4bXAuaWlkOjgzNzRDNzM3QTYzQjExRTNCNEU4ODYyM0FCMkQ1RTM0IiBzdFJlZjpkb2N1bWVudElEPSJ4bXAuZGlkOjgzNzRDNzM4QTYzQjExRTNCNEU4ODYyM0FCMkQ1RTM0Ii8+IDwvcmRmOkRlc2NyaXB0aW9uPiA8L3JkZjpSREY+IDwveDp4bXBtZXRhPiA8P3hwYWNrZXQgZW5kPSJyIj8+IselOQAAADNQTFRFWnOC8fP1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'; 

    it('pngs', function(done) {
      renderUrl(png, done);
    });

    it('svgs', function(done) {
      renderUrl(svg, done);
    });
  });

});
