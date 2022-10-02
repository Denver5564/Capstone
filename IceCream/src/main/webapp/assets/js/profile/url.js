$('.myButton').on('click', function(e) {

   e.preventDefault();

   var href = $(this).attr('href'),
       queryString = 'denver=1',
       newHref;

   if (href.indexOf('?') !== -1) {

       newHref = href + '&' + queryString;

   } else {

       newHref = href + '?' + queryString;
   }

   window.location.href = newHref;
});