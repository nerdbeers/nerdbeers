;
Nerdbeers = window.Nerdbeers || {};
Nerdbeers.Suggestions = {};

Nerdbeers.Suggestions.setupAutocomplete = function() {
    var cache_beer = {},
    	cache_topic = {};
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
              re = new RegExp(term, "i");
          $.each(data, function(idx, val){
            $.each(val.pairings, function(i, pair){
              if (re.test(pair.beer)) {
                list.push({ label: pair.beer + ' : ' + val.meeting_date, value: pair.beer});
              }
            });
          });

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
                list.push({ label: pair.topic + ' : ' + val.meeting_date, value: pair.topic});                 
              }
            });
          });

          cache_topic[ term ] = list;
          response( list );
        });
      }
    });
}