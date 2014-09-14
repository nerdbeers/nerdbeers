;
Nerdbeers = window.Nerdbeers || {};
Nerdbeers.Suggestions = {};

Nerdbeers.Suggestions.setupAutocomplete = function() {
    var cache_beer = {},
    	  cache_topic = {},
        f5_suggestions = ['Have you considered Coop F5?', 'May I suggest Coop F5?', 'Many nerds like a tasty IPA like COOP F5.'];

    $( ".nerdbeers-overflow-beer" ).autocomplete({
      minLength: 2,
      source: function( request, response ) {
        var term = request.term;
        if ( term in cache_beer ) {
          response( cache_beer[ term ] );
          return;
        }
 
        $.getJSON( "/api/agenda/all", request, function( data, status, xhr ) {
          var list = [],
              re = new RegExp(term, "i"),
              reF5 = new RegExp('F5','i');
          $.each(data, function(idx, val){
            $.each(val.pairings, function(i, pair){
              if (re.test(pair.beer)) {
                list.push({ label: pair.beer + ' : ' + val.perty_date, value: pair.beer});
              }
            });
          });

          var f5 = $.grep(list, function(val) {
              return reF5.test(val.label);
          });

          if (f5.length == 0){
            var item = f5_suggestions[Math.floor(Math.random()*f5_suggestions.length)];
            list.splice(0, 0, item);
          }

          cache_beer[ term ] = list;
          response( list );
        });
      }
    });

    $( ".nerdbeers-overflow-topic" ).autocomplete({
      minLength: 3,
      source: function( request, response ) {
        var term = request.term;
        if ( term in cache_topic ) {
          response( cache_topic[ term ] );
          return;
        }
 
        $.getJSON( "/api/agenda/all", request, function( data, status, xhr ) {
          var list = [],
              re = new RegExp(term, "i");
          $.each(data, function(idx, val){
            $.each(val.pairings, function(i, pair){
              if (re.test(pair.topic)) {
                list.push({ label: pair.topic + ' : ' + val.perty_date, value: pair.topic});                 
              }
            });
          });

          cache_topic[ term ] = list;
          response( list );
        });
      }
    });
}