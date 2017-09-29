/**
 * @authors 0936zz (zz5840@qq.com)
 * @date    2016-08-14 18:35
 */

function setEffects (player) {
	// 滑块
	player.dom.volRange.nstSlider({
		"left_grip_selector": ".mp-vol-circle",
		"value_changed_callback": function(cause, value) {
			player.dom.container.find('.mp-vol-current').width(value + '%');
			player.dom.volRange.trigger('change',[value]);
		}
	});
	player.dom.container.find('.mp-mode').click(function () {
		var dom = $(this);
		var mode = player.getPlayMode();
		dom.removeClass('mp-mode-'+mode);
		mode = mode == 3 ? 0 : mode + 1;
		player.changePlayMode(mode);
		dom.addClass('mp-mode-' + mode);
	});
	player.dom.container.find('.mp-list-toggle').click(function () {
		player.dom.container.find('.mp-list-box').toggleClass('mp-list-show');
	});
	player.dom.container.find('.mp-lrc-toggle').click(function () {
		//debugger;
		var classname = document.getElementById("lrc-sing");
		if(classname.className==='mp-lrc-box1 mp-lrc-show'){
		   classname.className = 'mp-lrc-box';
		}else{
		classname.className = 'mp-lrc-box1';
		player.dom.container.find('.mp-lrc-box1').toggleClass('mp-lrc-show');
		}
	});
	player.dom.container.find('.mp-toggle').click(function () {
		player.dom.container.toggleClass('mp-show');
	});
	player.dom.container.find('.mp-lrc-close').click(function () {
		var classname = document.getElementById("lrc-sing");
		classname.className = 'mp-lrc-box';
		player.dom.container.find('.mp-lrc-box').removeClass('mp-lrc-show');
	});
}
