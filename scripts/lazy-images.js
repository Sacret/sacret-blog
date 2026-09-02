'use strict';

// Native lazy loading for images.
// Replaces hexo-lazyload-image, which swapped every src for an animated
// placeholder and loaded the real image from JS.
hexo.extend.filter.register('after_render:html', function (html) {
  return html.replace(/<img\b(?![^>]*\sloading=)([^>]*?)(\/?)>/gi, function (tag, attrs, selfClosing) {
    // inline images are already in the document, nothing to defer
    if (/\ssrc=(["'])data:/i.test(attrs)) {
      return tag;
    }
    var extra = ' loading="lazy"';
    if (!/\sdecoding=/i.test(attrs)) {
      extra += ' decoding="async"';
    }
    return '<img' + attrs + extra + selfClosing + '>';
  });
});
