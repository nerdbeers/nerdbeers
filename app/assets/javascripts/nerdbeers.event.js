Nerdbeers = window.Nerdbeers || {};
Nerdbeers.EventNight = {};

Nerdbeers.EventNight.setup = function() {
	var id = 0, nextId = 1;
	var hide = function() {
		$('#event' + nextId).removeClass('hide');
		$('#event' + id).addClass('hide');
		id++;
		id = id > 3 ? 0 : id;
		nextId = id === 3 ? 0 : (id + 1);
	};
	setInterval(hide, 30000);
};