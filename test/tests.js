describe('render', function() {
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
      renderUrl('/base/test/i/designashirt.png', done);
    });

    it('svgs', function(done) {
      renderUrl('/base/test/i/publicdomain.svg', done);
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
    var svgDoc = '<svg width="20" height="20" xmlns="http://www.w3.org/2000/svg"><g transform="matrix(1,0,0,1,-0.91796875,28.6328125)"><path style="stroke-width:1;fill:#d30303;stroke:none;" d="M0.91796875 -28.6328125L27.8125 -28.6328125L27.8125 -21.5625L18.7890625 " /></g></svg>';
    var svg = 'data:image/svg+xml;base64,' + window.btoa(unescape(encodeURIComponent(svgDoc)));
    // http://en.wikipedia.org/wiki/Data_URI_scheme#Examples
    var png = 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAUAAAAFCAYAAACNbyblAAAAHElEQVQI12P4//8/w38GIAXDIBKE0DHxgljNBAAO9TXL0Y4OHwAAAABJRU5ErkJggg=='; 

    it('pngs', function(done) {
      renderUrl(png, done);
    });

    it('svgs', function(done) {
      renderUrl(svg, done);
    });
  });

});
