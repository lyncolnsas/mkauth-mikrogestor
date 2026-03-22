/*!
* PEDRO FILHO - pedro@pedrofilho.com.br
* SISTEMA MK-AUTH - www.mk-auth.com.br
*
* JS-COOKIE, SHOWPASSWORD, TOPBAR, SHA256, AUTOCOMPLETE
* SHUFFLE, ACCORDION, QUICKVIEW, TAGS, TOAST e MK-AUTH
*
* Licensed MIT: opensource.org/licenses/mit-license.php
*/

// CARREGA JS-COOKIE ------------------------------------------------------------------------------
(function (factory) {
	var registeredInModuleLoader = false;
	if (typeof define === 'function' && define.amd) {
		define(factory);
		registeredInModuleLoader = true;
	}
	if (typeof exports === 'object') {
		module.exports = factory();
		registeredInModuleLoader = true;
	}
	if (!registeredInModuleLoader) {
		var OldCookies = window.Cookies;
		var api = window.Cookies = factory();
		api.noConflict = function () {
			window.Cookies = OldCookies;
			return api;
		};
	}
}(function () {
	function extend () {
		var i = 0;
		var result = {};
		for (; i < arguments.length; i++) {
			var attributes = arguments[ i ];
			for (var key in attributes) {
				result[key] = attributes[key];
			}
		}
		return result;
	}

	function init (converter) {
		function api (key, value, attributes) {
			var result;
			if (typeof document === 'undefined') {
				return;
			}

			// Write
			if (arguments.length > 1) {
				attributes = extend({
					path: '/'
				}, api.defaults, attributes);

				if (typeof attributes.expires === 'number') {
					var expires = new Date();
					expires.setMilliseconds(expires.getMilliseconds() + attributes.expires * 864e+5);
					attributes.expires = expires;
				}

				attributes.expires = attributes.expires ? attributes.expires.toUTCString() : '';

				try {
					result = JSON.stringify(value);
					if (/^[\{\[]/.test(result)) {
						value = result;
					}
				} catch (e) {}

				if (!converter.write) {
					value = encodeURIComponent(String(value))
						.replace(/%(23|24|26|2B|3A|3C|3E|3D|2F|3F|40|5B|5D|5E|60|7B|7D|7C)/g, decodeURIComponent);
				} else {
					value = converter.write(value, key);
				}

				key = encodeURIComponent(String(key));
				key = key.replace(/%(23|24|26|2B|5E|60|7C)/g, decodeURIComponent);
				key = key.replace(/[\(\)]/g, escape);

				var stringifiedAttributes = '';

				for (var attributeName in attributes) {
					if (!attributes[attributeName]) {
						continue;
					}
					stringifiedAttributes += '; ' + attributeName;
					if (attributes[attributeName] === true) {
						continue;
					}
					stringifiedAttributes += '=' + attributes[attributeName];
				}
				return (document.cookie = key + '=' + value + stringifiedAttributes);
			}

			// Read
			if (!key) {
				result = {};
			}

			var cookies = document.cookie ? document.cookie.split('; ') : [];
			var rdecode = /(%[0-9A-Z]{2})+/g;
			var i = 0;

			for (; i < cookies.length; i++) {
				var parts = cookies[i].split('=');
				var cookie = parts.slice(1).join('=');

				if (!this.json && cookie.charAt(0) === '"') {
					cookie = cookie.slice(1, -1);
				}

				try {
					var name = parts[0].replace(rdecode, decodeURIComponent);
					cookie = converter.read ?
						converter.read(cookie, name) : converter(cookie, name) ||
						cookie.replace(rdecode, decodeURIComponent);

					if (this.json) {
						try {
							cookie = JSON.parse(cookie);
						} catch (e) {}
					}

					if (key === name) {
						result = cookie;
						break;
					}

					if (!key) {
						result[name] = cookie;
					}
				} catch (e) {}
			}

			return result;
		}

		api.set = api;
		api.get = function (key) {
			return api.call(api, key);
		};
		api.getJSON = function () {
			return api.apply({
				json: true
			}, [].slice.call(arguments));
		};
		api.defaults = {};

		api.remove = function (key, attributes) {
			api(key, '', extend(attributes, {
				expires: -1
			}));
		};

		api.withConverter = init;

		return api;
	}

	return init(function () {});
}));;;

// FUNCAO PARA MOSTRAR DADO EM CAMPO SENHA --------------------------------------------------------
(function (jQuery) {
	jQuery.fn.extend({
		showPassword: function(c) {

		var callback 	= {'fn':null,'args':{}}
		callback.fn = c;

		var cloneElement = function( element ) {
			var $element = $(element);

			$clone = $("<input />");

			$clone.attr({
				'id'		:	$element.attr('id')+'-clone',
				'type'		:	'text',
				'class'		:	$element.attr('class'),
				'style'		:	$element.attr('style'),
				'size'		:	$element.attr('size'),
				'name'		:	$element.attr('name')+'-clone',
				'onChange' 	:	$element.attr('onChange')
			});

			return $clone;
		};

		var update = function(a,b){
			b.val(a.val());
		};

		var setState = function( checkbox, a, b ){
			if(checkbox.is(':checked')){
			update(a,b);
			b.show();
			a.hide();
			} else {
			update(b,a);
			b.hide();
			a.show();
			}
		};

		return this.each(function() {
			var $input	= $(this),
			$checkbox 	= $($input.data('typetoggle'));

			var $clone = cloneElement($input);
			$clone.insertAfter($input);

			if(callback.fn){
				callback.args.input		= $input;
				callback.args.checkbox	= $checkbox;
				callback.args.clone 	= $clone;
			}

			$checkbox.bind('click', function() {
				setState( $checkbox, $input, $clone );
			});

			$input.bind('keyup', function() {
				update( $input, $clone )
			});

			$clone.bind('keyup', function(){
				update( $clone, $input );
				$input.trigger('keyup');
			});

			$clone.bind('blur', function() { $input.trigger('focusout'); });
			setState( $checkbox, $input, $clone );

			if( callback.fn ){
				callback.fn( callback.args );
			}
		});
		}
	});
})(jQuery);;;

// FUNCAO PARA MOSTRAR EMOGIS ---------------------------------------------------------------------
(function (jQuery) {
	jQuery.fn.emojis = function (params) {
		var defaults = {
			button: 'Emoji &#8627; &#x1F642;',
			place: 'before',
			emojis: ['&#x1F642;', '&#x1F609;', '&#x1F60A;', '&#x1f601;', '&#x1F917;', '&#x1f603;', '&#x1f604;', '&#x1f605;', '&#x1f606;', '&#x1F914;', '&#x1F911;', '&#x1f609;', '&#x1f60a;', '&#x1f60c;', '&#x1f60d;', '&#x1f60e;', '&#x1f60f;', '&#x1f611;', '&#x1f612;', '&#x1f613;', '&#x1f614;', '&#x1f615;', '&#x1f616;', '&#x1F449;', '&#x1F448;', '&#x1F447;', '&#x261D;', '&#x1F91D;', '&#x1F64F;', '&#x270D;', '&#x1F44B;', '&#x1F44D;', '&#x270C;', '&#x1F91D;', '&#x1F4AF;', '&#x2705;', '&#x1F4CE;', '&#x1F4CC;', '&#x1F4CB;', '&#x2709;', '&#x1F4B3;', '&#x1F4B2;', '&#x1F4B5;', '&#x1F4BB;', '&#x1F4F1;', '&#x1F4E2;', '&#x1F49E;', '&#x1F49A;', '&#x1F499;', '&#x2764;', '&#x231B;', '&#x1F30E;', '&#x1F4F6;'],
			fontSize: '26px',
			listCSS: {border: '1px solid gray', 'background-color': '#fff', display: 'none'},
			rowSize: 10,
		};
		var settings = {};
		if (!params) {
			settings = defaults;
		} else {
			for (var n in defaults) {
				settings[n] = params[n] ? params[n] : defaults[n];
			}
		}

		this.each(function (n, input) {
			var jQueryinput = jQuery(input);

			function showEmoji() {
				jQuerylist.show();
				jQueryinput.focus();
				setTimeout(function () {
					jQuery(document).on('click', closeEmoji);
				}, 1);
			}

			function closeEmoji() {
				jQuerylist.hide();
				jQuery(document).off('click', closeEmoji);
			}

			function clickEmoji(ev) {
				if (input.selectionStart || input.selectionStart == '0') {
					var startPos = input.selectionStart;
					var endPos = input.selectionEnd;
					input.value = input.value.substring(0, startPos)
						+ ev.currentTarget.innerHTML
						+ input.value.substring(endPos, input.value.length);
				} else {
					input.value += ev.currentTarget.innerHTML;
				}

				closeEmoji();
				jQueryinput.focus();
				input.selectionStart = startPos + 2;
				input.selectionEnd = endPos + 2;
			}

			var jQuerybutton = jQuery("<span>").html(settings.button).css({cursor: 'pointer', 'font-size': settings.fontSize}).on('click', showEmoji);
			var jQuerylist = jQuery('<div>').css(defaults.listCSS).css(settings.listCSS);
			for (var n in settings.emojis) {
				jQuery("<span>").html(settings.emojis[n]).css({cursor: 'pointer', 'font-size': settings.fontSize}).on('click', clickEmoji).appendTo(jQuerylist);
			}

			if (settings.place === 'after') {
				jQuerybutton.insertBefore(this);
			} else {
				jQuerybutton.insertAfter(this);
			}
			jQuerylist.insertAfter(jQueryinput);
		});
		return this;
	};
})(jQuery);;;


// CARREGA TOPBAR ---------------------------------------------------------------------------------
(function (window, document) {
	"use strict";
	(function () {
		var lastTime = 0;
		var vendors = ["ms", "moz", "webkit", "o"];
		for (var x = 0; x < vendors.length && !window.requestAnimationFrame; ++x) {
		window.requestAnimationFrame =
		window[vendors[x] + "RequestAnimationFrame"];
		window.cancelAnimationFrame =
		window[vendors[x] + "CancelAnimationFrame"] ||
		window[vendors[x] + "CancelRequestAnimationFrame"];
		}
		if (!window.requestAnimationFrame)
		window.requestAnimationFrame = function (callback, element) {
			var currTime = new Date().getTime();
			var timeToCall = Math.max(0, 16 - (currTime - lastTime));
			var id = window.setTimeout(function () {
				callback(currTime + timeToCall);
			}, timeToCall);
			lastTime = currTime + timeToCall;
			return id;
		};
		if (!window.cancelAnimationFrame)
		window.cancelAnimationFrame = function (id) {
			clearTimeout(id);
		};
	})();

	var canvas,
	progressTimerId,
	fadeTimerId,
	currentProgress,
	showing,
	addEvent = function (elem, type, handler) {
		if (elem.addEventListener) elem.addEventListener(type, handler, false);
		else if (elem.attachEvent) elem.attachEvent("on" + type, handler);
		else elem["on" + type] = handler;
	},
	options = {
		autoRun: true,
		barThickness: 3,
		barColors: {
			0: "rgba(26,  188, 156, .9)",
			".25": "rgba(52,  152, 219, .9)",
			".50": "rgba(241, 196, 15,  .9)",
			".75": "rgba(230, 126, 34,  .9)",
			"1.0": "rgba(211, 84,  0,   .9)",
		},
		shadowBlur: 10,
		shadowColor: "rgba(0,   0,   0,   .6)",
		className: null,
	},
	repaint = function () {
		canvas.width = window.innerWidth;
		canvas.height = options.barThickness * 5;
		var ctx = canvas.getContext("2d");
		ctx.shadowBlur = options.shadowBlur;
		ctx.shadowColor = options.shadowColor;
		var lineGradient = ctx.createLinearGradient(0, 0, canvas.width, 0);
		for (var stop in options.barColors)
		lineGradient.addColorStop(stop, options.barColors[stop]);
		ctx.lineWidth = options.barThickness;
		ctx.beginPath();
		ctx.moveTo(0, options.barThickness / 2);
		ctx.lineTo(
		Math.ceil(currentProgress * canvas.width),
		options.barThickness / 2
		);
		ctx.strokeStyle = lineGradient;
		ctx.stroke();
	},
	createCanvas = function () {
		canvas = document.createElement("canvas");
		var style = canvas.style;
		style.position = "fixed";
		style.top = style.left = style.right = style.margin = style.padding = 0;
		style.zIndex = 100001;
		style.display = "none";
		if (options.className) canvas.classList.add(options.className);
		document.body.appendChild(canvas);
		addEvent(window, "resize", repaint);
	},
	topbar = {
		config: function (opts) {
			for (var key in opts)
			if (options.hasOwnProperty(key)) options[key] = opts[key];
		},
		show: function () {
			if (showing) return;
			showing = true;
			if (fadeTimerId !== null) window.cancelAnimationFrame(fadeTimerId);
			if (!canvas) createCanvas();
			canvas.style.opacity = 1;
			canvas.style.display = "block";
			topbar.progress(0);
			if (options.autoRun) {
				(function loop() {
				progressTimerId = window.requestAnimationFrame(loop);
				topbar.progress(
				"+" + 0.05 * Math.pow(1 - Math.sqrt(currentProgress), 2)
				);
				})();
			}
		},
		progress: function (to) {
			if (typeof to === "undefined") return currentProgress;
			if (typeof to === "string") {
			to =
			(to.indexOf("+") >= 0 || to.indexOf("-") >= 0
			? currentProgress
			: 0) + parseFloat(to);
			}
			currentProgress = to > 1 ? 1 : to;
			repaint();
			return currentProgress;
		},
		hide: function () {
			if (!showing) return;
			showing = false;
			if (progressTimerId != null) {
				window.cancelAnimationFrame(progressTimerId);
				progressTimerId = null;
			}
			(function loop() {
				if (topbar.progress("+.1") >= 1) {
					canvas.style.opacity -= 0.05;
					if (canvas.style.opacity <= 0.05) {
						canvas.style.display = "none";
						fadeTimerId = null;
						return;
					}
				}
				fadeTimerId = window.requestAnimationFrame(loop);
			})();
		},
	};

	if (typeof module === "object" && typeof module.exports === "object") {
		module.exports = topbar;
	} else if (typeof define === "function" && define.amd) {
		define(function () {
			return topbar;
		});
	} else {
		this.topbar = topbar;
	}
}.call(this, window, document));

const mkaJsLoad = function() {
	return {
		go: function(p) {
			if (p == 100) {
				topbar.hide();
			} else {
				topbar.show();
			}
		}
	}
};

const mktopo = mkaJsLoad();;;

// HASH SHA256 ------------------------------------------------------------------------------------
const S2H5A6 = function(r) {
	var t = 8,
		n = 0;
	function e(r, t) {
		var n = (65535 & r) + (65535 & t);
		return (((r >> 16) + (t >> 16) + (n >> 16)) << 16) | (65535 & n);
	}
	function o(r, t) {
		return (r >>> t) | (r << (32 - t));
	}
	function u(r, t) {
		return r >>> t;
	}
	function a(r, t, n) {
		return (r & t) ^ (~r & n);
	}
	function f(r, t, n) {
		return (r & t) ^ (r & n) ^ (t & n);
	}
	function c(r) {
		return o(r, 2) ^ o(r, 13) ^ o(r, 22);
	}
	function h(r) {
		return o(r, 6) ^ o(r, 11) ^ o(r, 25);
	}
	function i(r) {
		return o(r, 7) ^ o(r, 18) ^ u(r, 3);
	}
	return (function (r) {
		for (var t = n ? "0123456789ABCDEF" : "0123456789abcdef", e = "", o = 0; o < 4 * r.length; o++) e += t.charAt((r[o >> 2] >> (8 * (3 - (o % 4)) + 4)) & 15) + t.charAt((r[o >> 2] >> (8 * (3 - (o % 4)))) & 15);
		return e;
	})(
		(function (r, t) {
			var n, s, C, A,	d, g, p, v,	m, l, y, w = new Array(1116352408, 1899447441, 3049323471, 3921009573, 961987163, 1508970993, 2453635748, 2870763221, 3624381080, 310598401, 607225278, 1426881987, 1925078388, 2162078206, 2614888103, 3248222580, 3835390401, 4022224774, 264347078, 604807628, 770255983, 1249150122, 1555081692, 1996064986, 2554220882, 2821834349, 2952996808, 3210313671, 3336571891, 3584528711, 113926993, 338241895, 666307205, 773529912, 1294757372, 1396182291, 1695183700, 1986661051, 2177026350, 2456956037, 2730485921, 2820302411, 3259730800, 3345764771, 3516065817, 3600352804, 4094571909, 275423344, 430227734, 506948616, 659060556, 883997877, 958139571, 1322822218, 1537002063, 1747873779, 1955562222, 2024104815, 2227730452, 2361852424, 2428436474, 2756734187, 3204031479, 3329325298),
			b = new Array(1779033703, 3144134277, 1013904242, 2773480762, 1359893119, 2600822924, 528734635, 1541459225),
			S = new Array(64);
			(r[t >> 5] |= 128 << (24 - (t % 32))), (r[15 + (((t + 64) >> 9) << 4)] = t);
			for (var k = 0; k < r.length; k += 16) {
				(n = b[0]), (s = b[1]), (C = b[2]), (A = b[3]), (d = b[4]), (g = b[5]), (p = b[6]), (v = b[7]);
				for (var _ = 0; _ < 64; _++)
					(S[_] = _ < 16 ? r[_ + k] : e(e(e(o((y = S[_ - 2]), 17) ^ o(y, 19) ^ u(y, 10), S[_ - 7]), i(S[_ - 15])), S[_ - 16])),
						(m = e(e(e(e(v, h(d)), a(d, g, p)), w[_]), S[_])),
						(l = e(c(n), f(n, s, C))),
						(v = p),
						(p = g),
						(g = d),
						(d = e(A, m)),
						(A = C),
						(C = s),
						(s = n),
						(n = e(m, l));
				(b[0] = e(n, b[0])), (b[1] = e(s, b[1])), (b[2] = e(C, b[2])), (b[3] = e(A, b[3])), (b[4] = e(d, b[4])), (b[5] = e(g, b[5])), (b[6] = e(p, b[6])), (b[7] = e(v, b[7]));
			}
			return b;
		})(
			(function (r) {
				for (var n = Array(), e = (1 << t) - 1, o = 0; o < r.length * t; o += t) n[o >> 5] |= (r.charCodeAt(o / t) & e) << (24 - (o % 32));
				return n;
			})((r = utf8_encode(r))),
			r.length * t
		)
	);
};;;

// CRIA CAMPO AUTOCOMPLETE ------------------------------------------------------------------------
var autoComplete = (function() {
	function autoComplete(options) {
		if (!document.querySelector) return;

		function hasClass(el, className) {
			return el.classList ? el.classList.contains(className) : new RegExp('\\b' + className + '\\b').test(el.className);
		}

		function addEvent(el, type, handler) {
			if (el.attachEvent) el.attachEvent('on' + type, handler);
			else el.addEventListener(type, handler);
		}

		function removeEvent(el, type, handler) {
			if (el.detachEvent) el.detachEvent('on' + type, handler);
			else el.removeEventListener(type, handler);
		}

		function live(elClass, event, cb, context) {
			addEvent(context || document, event, function(e) {
				var found, el = e.target || e.srcElement;
				while (el && !(found = hasClass(el, elClass))) el = el.parentElement;
				if (found) cb.call(el, e);
			});
		}

		var o = {
			selector: 0,
			source: 0,
			minChars: 3,
			delay: 150,
			offsetLeft: 0,
			offsetTop: 1,
			cache: 1,
			menuClass: '',
			renderItem: function(item, search) {
				search = search.replace(/[-\/\\^$*+?.()|[\]{}]/g, '\\$&');
				var re = new RegExp("(" + search.split(' ').join('|') + ")", "gi");
				return '<div class="autocomplete-sugestao" data-val="' + item + '">' + item.replace(re, "<b>$1</b>") + '</div>';
			},
			onSelect: function(e, term, item) {}
		};
		for (var k in options) {
			if (options.hasOwnProperty(k)) o[k] = options[k];
		}

		var elems = typeof o.selector == 'object' ? [o.selector] : document.querySelectorAll(o.selector);
		for (var i = 0; i < elems.length; i++) {
			var that = elems[i];

			that.sc = document.createElement('div');
			that.sc.className = 'autocomplete-sugestoes ' + o.menuClass;

			that.autocompleteAttr = that.getAttribute('autocomplete');
			that.setAttribute('autocomplete', 'off');
			that.cache = {};
			that.last_val = '';

			that.updateSC = function(resize, next) {
				var rect = that.getBoundingClientRect();
				that.sc.style.left = Math.round(rect.left + (window.pageXOffset || document.documentElement.scrollLeft) + o.offsetLeft) + 'px';
				that.sc.style.top = Math.round(rect.bottom + (window.pageYOffset || document.documentElement.scrollTop) + o.offsetTop) + 'px';
				that.sc.style.width = Math.round(rect.right - rect.left) + 'px'; // outerWidth
				if (!resize) {
					that.sc.style.display = 'block';
					if (!that.sc.maxHeight) {
						that.sc.maxHeight = parseInt((window.getComputedStyle ? getComputedStyle(that.sc, null) : that.sc.currentStyle).maxHeight);
					}
					if (!that.sc.suggestionHeight) that.sc.suggestionHeight = that.sc.querySelector('.autocomplete-sugestao').offsetHeight;
					if (that.sc.suggestionHeight)
						if (!next) that.sc.scrollTop = 0;
						else {
							var scrTop = that.sc.scrollTop,
								selTop = next.getBoundingClientRect().top - that.sc.getBoundingClientRect().top;
							if (selTop + that.sc.suggestionHeight - that.sc.maxHeight > 0)
								that.sc.scrollTop = selTop + that.sc.suggestionHeight + scrTop - that.sc.maxHeight;
							else if (selTop < 0)
								that.sc.scrollTop = selTop + scrTop;
						}
				}
			}
			addEvent(window, 'resize', that.updateSC);
			document.body.appendChild(that.sc);

			live('autocomplete-sugestao', 'mouseleave', function(e) {
				var sel = that.sc.querySelector('.autocomplete-sugestao.selected');
				if (sel) setTimeout(function() {
					sel.className = sel.className.replace('selected', '');
				}, 20);
			}, that.sc);

			live('autocomplete-sugestao', 'mouseover', function(e) {
				var sel = that.sc.querySelector('.autocomplete-sugestao.selected');
				if (sel) sel.className = sel.className.replace('selected', '');
				this.className += ' selected';
			}, that.sc);

			live('autocomplete-sugestao', 'mousedown', function(e) {
				if (hasClass(this, 'autocomplete-sugestao')) { // else outside click
					var v = this.getAttribute('data-val');
					that.value = v;
					o.onSelect(e, v, this);
					that.sc.style.display = 'none';
				}
			}, that.sc);

			that.blurHandler = function() {
				try {
					var over_sb = document.querySelector('.autocomplete-sugestoes:hover');
				} catch (e) {
					var over_sb = 0;
				}
				if (!over_sb) {
					that.last_val = that.value;
					that.sc.style.display = 'none';
					setTimeout(function() {
						that.sc.style.display = 'none';
					}, 350);
				} else if (that !== document.activeElement) setTimeout(function() {
					that.focus();
				}, 20);
			};
			addEvent(that, 'blur', that.blurHandler);

			var suggest = function(data) {
				var val = that.value;
				that.cache[val] = data;
				if (data.length && val.length >= o.minChars) {
					var s = '';
					for (var i = 0; i < data.length; i++) s += o.renderItem(data[i], val);
					that.sc.innerHTML = s;
					that.updateSC(0);
				} else
					that.sc.style.display = 'none';
			}

			that.keydownHandler = function(e) {
				var key = window.event ? e.keyCode : e.which;
				if ((key == 40 || key == 38) && that.sc.innerHTML) {
					var next, sel = that.sc.querySelector('.autocomplete-sugestao.selected');
					if (!sel) {
						next = (key == 40) ? that.sc.querySelector('.autocomplete-sugestao') : that.sc.childNodes[that.sc.childNodes.length - 1]; // first : last
						next.className += ' selected';
						that.value = next.getAttribute('data-val');
					} else {
						next = (key == 40) ? sel.nextSibling : sel.previousSibling;
						if (next) {
							sel.className = sel.className.replace('selected', '');
							next.className += ' selected';
							that.value = next.getAttribute('data-val');
						} else {
							sel.className = sel.className.replace('selected', '');
							that.value = that.last_val;
							next = 0;
						}
					}
					that.updateSC(0, next);
					return false;
				}

				// esc
				else if (key == 27) {
					that.value = that.last_val;
					that.sc.style.display = 'none';
				}

				// enter
				else if (key == 13 || key == 9) {
					var sel = that.sc.querySelector('.autocomplete-sugestao.selected');
					if (sel && that.sc.style.display != 'none') {
						o.onSelect(e, sel.getAttribute('data-val'), sel);
						setTimeout(function() {
							that.sc.style.display = 'none';
						}, 20);
					}
				}
			};
			addEvent(that, 'keydown', that.keydownHandler);

			that.keyupHandler = function(e) {
				var key = window.event ? e.keyCode : e.which;
				if (!key || (key < 35 || key > 40) && key != 13 && key != 27) {
					var val = that.value;
					if (val.length >= o.minChars) {
						if (val != that.last_val) {
							that.last_val = val;
							clearTimeout(that.timer);
							if (o.cache) {
								if (val in that.cache) {
									suggest(that.cache[val]);
									return;
								}
								for (var i = 1; i < val.length - o.minChars; i++) {
									var part = val.slice(0, val.length - i);
									if (part in that.cache && !that.cache[part].length) {
										suggest([]);
										return;
									}
								}
							}
							that.timer = setTimeout(function() {
								o.source(val, suggest)
							}, o.delay);
						}
					} else {
						that.last_val = val;
						that.sc.style.display = 'none';
					}
				}
			};
			addEvent(that, 'keyup', that.keyupHandler);

			that.focusHandler = function(e) {
				that.last_val = '\n';
				that.keyupHandler(e)
			};
			if (!o.minChars) addEvent(that, 'focus', that.focusHandler);
		}

		this.destroy = function() {
			for (var i = 0; i < elems.length; i++) {
				var that = elems[i];
				removeEvent(window, 'resize', that.updateSC);
				removeEvent(that, 'blur', that.blurHandler);
				removeEvent(that, 'focus', that.focusHandler);
				removeEvent(that, 'keydown', that.keydownHandler);
				removeEvent(that, 'keyup', that.keyupHandler);
				if (that.autocompleteAttr)
					that.setAttribute('autocomplete', that.autocompleteAttr);
				else
					that.removeAttribute('autocomplete');
				document.body.removeChild(that.sc);
				that = null;
			}
		};
	}
	return autoComplete;
})();

(function() {
	if (typeof define === 'function' && define.amd)
		define('autoComplete', function() {
			return autoComplete;
		});
	else if (typeof module !== 'undefined' && module.exports)
		module.exports = autoComplete;
	else
		window.autoComplete = autoComplete;
})();;;

// FUNCAO DE SHUFFLE NO TEXTO ---------------------------------------------------------------------
(function (global, factory) {
	typeof exports === "object" && typeof module !== "undefined" ? (module.exports = factory()) : typeof define === "function" && define.amd ? define(factory) : (global.ShuffleText = factory());
})(this, function () {
	"use strict";
	var ShuffleText = (function () {
		function ShuffleText(element) {
			this.sourceRandomCharacter = "1234567890";
			this.emptyCharacter = "-";
			this.duration = 600;
			this._isRunning = false;
			this._originalStr = "";
			this._originalLength = 0;
			this._timeCurrent = 0;
			this._timeStart = 0;
			this._randomIndex = [];
			this._requestAnimationFrameId = 0;
			this._element = element;
			this.setText(element.innerHTML);
		}
		ShuffleText.prototype.setText = function (text) {
			this._originalStr = text;
			this._originalLength = text.length;
		};
		Object.defineProperty(ShuffleText.prototype, "isRunning", {
			get: function () {
				return this.isRunning;
			},
			enumerable: true,
			configurable: true,
		});
		ShuffleText.prototype.start = function () {
			var _this = this;
			this.stop();
			this._randomIndex = [];
			var str = "";
			for (var i = 0; i < this._originalLength; i++) {
				var rate = i / this._originalLength;
				this._randomIndex[i] = Math.random() * (1 - rate) + rate;
				str += this.emptyCharacter;
			}
			this._timeStart = new Date().getTime();
			this._isRunning = true;
			this._requestAnimationFrameId = requestAnimationFrame(function () {
				_this._onInterval();
			});
			this._element.innerHTML = str;
		};
		ShuffleText.prototype.stop = function () {
			this._isRunning = false;
			cancelAnimationFrame(this._requestAnimationFrameId);
		};
		ShuffleText.prototype.dispose = function () {
			this.sourceRandomCharacter = null;
			this.emptyCharacter = null;
			this._isRunning = false;
			this.duration = 0;
			this._originalStr = null;
			this._originalLength = 0;
			this._timeCurrent = 0;
			this._timeStart = 0;
			this._randomIndex = null;
			this._element = null;
			this._requestAnimationFrameId = 0;
		};
		ShuffleText.prototype._onInterval = function () {
			var _this = this;
			this._timeCurrent = new Date().getTime() - this._timeStart;
			var percent = this._timeCurrent / this.duration;
			var str = "";
			for (var i = 0; i < this._originalLength; i++) {
				if (percent >= this._randomIndex[i]) {
					str += this._originalStr.charAt(i);
				} else if (percent < this._randomIndex[i] / 3) {
					str += this.emptyCharacter;
				} else {
					str += this.sourceRandomCharacter.charAt(Math.floor(Math.random() * this.sourceRandomCharacter.length));
				}
			}
			if (percent > 1) {
				str = this._originalStr;
				this._isRunning = false;
			}
			this._element.innerHTML = str;
			if (this._isRunning === true) {
				this._requestAnimationFrameId = requestAnimationFrame(function () {
					_this._onInterval();
				});
			}
		};
		return ShuffleText;
	})();
	return ShuffleText;
});

const run_shuffle = function() {
	if (jQuery("#shuffle1").get(0) != undefined) {
		const txt_shuffle1 = new ShuffleText(jQuery("#shuffle1").get(0));
		txt_shuffle1.start();
	}

	if (jQuery("#shuffle2").get(0) != undefined) {
		const txt_shuffle2 = new ShuffleText(jQuery("#shuffle2").get(0));
		txt_shuffle2.start();
	}

	if (jQuery("#shuffle3").get(0) != undefined) {
		const txt_shuffle3 = new ShuffleText(jQuery("#shuffle3").get(0));
		txt_shuffle3.start();
	}

	if (jQuery("#shuffle4").get(0) != undefined) {
		const txt_shuffle4 = new ShuffleText(jQuery("#shuffle4").get(0));
		txt_shuffle4.start();
	}

	if (jQuery("#shuffle5").get(0) != undefined) {
		const txt_shuffle5 = new ShuffleText(jQuery("#shuffle5").get(0));
		txt_shuffle5.start();
	}

	if (jQuery("#shuffle6").get(0) != undefined) {
		const txt_shuffle6 = new ShuffleText(jQuery("#shuffle6").get(0));
		txt_shuffle6.start();
	}
};;;

// CRIA ACCORDION DINAMICO ------------------------------------------------------------------------
(function webpackUniversalModuleDefinition(root, factory) {
	if (typeof exports === 'object' && typeof module === 'object')
		module.exports = factory();
	else if (typeof define === 'function' && define.amd)
		define([], factory);
	else if (typeof exports === 'object')
		exports["styleAccordion"] = factory();
	else
		root["styleAccordion"] = factory();
})(typeof self !== 'undefined' ? self : this, function() {
	return (function(modules) {
			var installedModules = {};

			function __webpack_require__(moduleId) {

				if (installedModules[moduleId]) {
					return installedModules[moduleId].exports;
				}
				var module = installedModules[moduleId] = {
					i: moduleId,
					l: false,
					exports: {}
				};

				modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);

				module.l = true;

				return module.exports;
			}

			__webpack_require__.m = modules;

			__webpack_require__.c = installedModules;

			__webpack_require__.d = function(exports, name, getter) {
				if (!__webpack_require__.o(exports, name)) {
					Object.defineProperty(exports, name, {
						configurable: false,
						enumerable: true,
						get: getter
					});
				}
			};

			__webpack_require__.n = function(module) {
				var getter = module && module.__esModule ?
					function getDefault() {
						return module['default'];
					} :
					function getModuleExports() {
						return module;
					};
				__webpack_require__.d(getter, 'a', getter);
				return getter;
			};

			__webpack_require__.o = function(object, property) {
				return Object.prototype.hasOwnProperty.call(object, property);
			};

			__webpack_require__.p = "";

			return __webpack_require__(__webpack_require__.s = 0);
		})
		([
			(function(module, __webpack_exports__, __webpack_require__) {

				'use strict';
				Object.defineProperty(__webpack_exports__, "__esModule", {
					value: true
				});
				var __WEBPACK_IMPORTED_MODULE_0__events__ = __webpack_require__(1);
				var _createClass = function() {
					function defineProperties(target, props) {
						for (var i = 0; i < props.length; i++) {
							var descriptor = props[i];
							descriptor.enumerable = descriptor.enumerable || false;
							descriptor.configurable = true;
							if ("value" in descriptor) descriptor.writable = true;
							Object.defineProperty(target, descriptor.key, descriptor);
						}
					}
					return function(Constructor, protoProps, staticProps) {
						if (protoProps) defineProperties(Constructor.prototype, protoProps);
						if (staticProps) defineProperties(Constructor, staticProps);
						return Constructor;
					};
				}();

				function _classCallCheck(instance, Constructor) {
					if (!(instance instanceof Constructor)) {
						throw new TypeError("Cannot call a class as a function");
					}
				}

				function _possibleConstructorReturn(self, call) {
					if (!self) {
						throw new ReferenceError("this hasn't been initialised");
					}
					return call && (typeof call === "object" || typeof call === "function") ? call : self;
				}

				function _inherits(subClass, superClass) {
					if (typeof superClass !== "function" && superClass !== null) {
						throw new TypeError("Super expression must either be null or a function, not " + typeof superClass);
					}
					subClass.prototype = Object.create(superClass && superClass.prototype, {
						constructor: {
							value: subClass,
							enumerable: false,
							writable: true,
							configurable: true
						}
					});
					if (superClass) Object.setPrototypeOf ? Object.setPrototypeOf(subClass, superClass) : subClass.__proto__ = superClass;
				}

				var onStyleAccordionClick = Symbol('onStyleAccordionClick');

				var styleAccordion = function(_EventEmitter) {
					_inherits(styleAccordion, _EventEmitter);

					function styleAccordion(selector) {
						var options = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : {};

						_classCallCheck(this, styleAccordion);

						var _this = _possibleConstructorReturn(this, (styleAccordion.__proto__ || Object.getPrototypeOf(styleAccordion)).call(this));

						_this.element = typeof selector === 'string' ? document.querySelector(selector) : selector;
						if (!_this.element) {
							throw new Error('An invalid selector.');
						}

						_this._clickEvents = ['click'];

						_this[onStyleAccordionClick] = _this[onStyleAccordionClick].bind(_this);

						_this.init();
						return _this;
					}

					_createClass(styleAccordion, [{
						key: 'init',

						value: function init() {
							this.items = this.element.querySelectorAll('.accordion .toggle') || [];

							this._bindEvents();
						}
					}, {
						key: 'destroy',
						value: function destroy() {
							var _this2 = this;

							this.items.forEach(function(item) {
								_this2._clickEvents.forEach(function(clickEvent) {
									item.removeEventListener(clickEvent, _this2[onStyleAccordionClick], false);
								});
							});
						}

					}, {
						key: '_bindEvents',
						value: function _bindEvents() {
							var _this3 = this;

							this.items.forEach(function(item) {
								_this3._clickEvents.forEach(function(clickEvent) {
									item.addEventListener(clickEvent, _this3[onStyleAccordionClick], false);
								});
							});
						}

					}, {
						key: onStyleAccordionClick,
						value: function value(e) {
							e.preventDefault();

							var target = e.currentTarget.closest('.accordion') || e.currentTarget;
							if (!target.classList.contains('is-active')) {
								var activeItem = this.element.querySelector('.accordion.is-active');
								if (activeItem) {
									activeItem.classList.remove('is-active');
								}
								target.classList.add('is-active');
							} else {
								target.classList.remove('is-active');
							}
						}
					}], [{
						key: 'attach',
						value: function attach() {
							var selector = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : '.accordions';

							var instances = new Array();

							var elements = document.querySelectorAll(selector);
							[].forEach.call(elements, function(element) {
								setTimeout(function() {
									instances.push(new styleAccordion(element));
								}, 100);
							});
							return instances;
						}
					}]);

					return styleAccordion;
				}(__WEBPACK_IMPORTED_MODULE_0__events__["a"]);

				__webpack_exports__["default"] = (styleAccordion);

			}),

			(function(module, __webpack_exports__, __webpack_require__) {

				'use strict';
				var _createClass = function() {
					function defineProperties(target, props) {
						for (var i = 0; i < props.length; i++) {
							var descriptor = props[i];
							descriptor.enumerable = descriptor.enumerable || false;
							descriptor.configurable = true;
							if ("value" in descriptor) descriptor.writable = true;
							Object.defineProperty(target, descriptor.key, descriptor);
						}
					}
					return function(Constructor, protoProps, staticProps) {
						if (protoProps) defineProperties(Constructor.prototype, protoProps);
						if (staticProps) defineProperties(Constructor, staticProps);
						return Constructor;
					};
				}();

				function _classCallCheck(instance, Constructor) {
					if (!(instance instanceof Constructor)) {
						throw new TypeError("Cannot call a class as a function");
					}
				}

				var EventEmitter = function() {
					function EventEmitter() {
						var listeners = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : [];

						_classCallCheck(this, EventEmitter);

						this._listeners = new Map(listeners);
						this._middlewares = new Map();
					}

					_createClass(EventEmitter, [{
						key: "listenerCount",
						value: function listenerCount(eventName) {
							if (!this._listeners.has(eventName)) {
								return 0;
							}

							var eventListeners = this._listeners.get(eventName);
							return eventListeners.length;
						}
					}, {
						key: "removeListeners",
						value: function removeListeners() {
							var _this = this;

							var eventName = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : null;
							var middleware = arguments.length > 1 && arguments[1] !== undefined ? arguments[1] : false;

							if (eventName !== null) {
								if (Array.isArray(eventName)) {
									name.forEach(function(e) {
										return _this.removeListeners(e, middleware);
									});
								} else {
									this._listeners.delete(eventName);

									if (middleware) {
										this.removeMiddleware(eventName);
									}
								}
							} else {
								this._listeners = new Map();
							}
						}
					}, {
						key: "middleware",
						value: function middleware(eventName, fn) {
							var _this2 = this;

							if (Array.isArray(eventName)) {
								name.forEach(function(e) {
									return _this2.middleware(e, fn);
								});
							} else {
								if (!Array.isArray(this._middlewares.get(eventName))) {
									this._middlewares.set(eventName, []);
								}

								this._middlewares.get(eventName).push(fn);
							}
						}
					}, {
						key: "removeMiddleware",
						value: function removeMiddleware() {
							var _this3 = this;

							var eventName = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : null;

							if (eventName !== null) {
								if (Array.isArray(eventName)) {
									name.forEach(function(e) {
										return _this3.removeMiddleware(e);
									});
								} else {
									this._middlewares.delete(eventName);
								}
							} else {
								this._middlewares = new Map();
							}
						}
					}, {
						key: "on",
						value: function on(name, callback) {
							var _this4 = this;

							var once = arguments.length > 2 && arguments[2] !== undefined ? arguments[2] : false;

							if (Array.isArray(name)) {
								name.forEach(function(e) {
									return _this4.on(e, callback);
								});
							} else {
								name = name.toString();
								var split = name.split(/,|, | /);

								if (split.length > 1) {
									split.forEach(function(e) {
										return _this4.on(e, callback);
									});
								} else {
									if (!Array.isArray(this._listeners.get(name))) {
										this._listeners.set(name, []);
									}

									this._listeners.get(name).push({
										once: once,
										callback: callback
									});
								}
							}
						}
					}, {
						key: "once",
						value: function once(name, callback) {
							this.on(name, callback, true);
						}
					}, {
						key: "emit",
						value: function emit(name, data) {
							var _this5 = this;

							var silent = arguments.length > 2 && arguments[2] !== undefined ? arguments[2] : false;

							name = name.toString();
							var listeners = this._listeners.get(name);
							var middlewares = null;
							var doneCount = 0;
							var execute = silent;

							if (Array.isArray(listeners)) {
								listeners.forEach(function(listener, index) {
									if (!silent) {
										middlewares = _this5._middlewares.get(name);
										if (Array.isArray(middlewares)) {
											middlewares.forEach(function(middleware) {
												middleware(data, function() {
													var newData = arguments.length > 0 && arguments[0] !== undefined ? arguments[0] : null;

													if (newData !== null) {
														data = newData;
													}
													doneCount++;
												}, name);
											});

											if (doneCount >= middlewares.length) {
												execute = true;
											}
										} else {
											execute = true;
										}
									}

									if (execute) {
										if (listener.once) {
											listeners[index] = null;
										}
										listener.callback(data);
									}
								});

								while (listeners.indexOf(null) !== -1) {
									listeners.splice(listeners.indexOf(null), 1);
								}
							}
						}
					}]);

					return EventEmitter;
				}();

				__webpack_exports__["a"] = (EventEmitter);

			})
		])["default"];
});;;

// CRIA JANELA QUICKVIEW --------------------------------------------------------------------------
! function (e, t) {
	"object" == typeof exports && "object" == typeof module ? module.exports = t() : "function" == typeof define && define.amd ? define([], t) : "object" == typeof exports ? exports.mkaQuickview = t() : e.mkaQuickview = t()
}("undefined" != typeof self ? self : this, function () {
	return function (n) {
		var i = {};

		function r(e) {
			if (i[e]) return i[e].exports;
			var t = i[e] = {
				i: e,
				l: !1,
				exports: {}
			};
			return n[e].call(t.exports, t, t.exports, r), t.l = !0, t.exports
		}
		return r.m = n, r.c = i, r.d = function (e, t, n) {
			r.o(e, t) || Object.defineProperty(e, t, {
				configurable: !1,
				enumerable: !0,
				get: n
			})
		}, r.n = function (e) {
			var t = e && e.__esModule ? function () {
				return e.default
			} : function () {
				return e
			};
			return r.d(t, "a", t), t
		}, r.o = function (e, t) {
			return Object.prototype.hasOwnProperty.call(e, t)
		}, r.p = "", r(r.s = 0)
	}([function (e, t, n) {
		'use strict';
		Object.defineProperty(t, "__esModule", {
			value: !0
		});
		var i = n(1),
			o = n(2),
			s = Object.assign || function (e) {
				for (var t = 1; t < arguments.length; t++) {
					var n = arguments[t];
					for (var i in n) Object.prototype.hasOwnProperty.call(n, i) && (e[i] = n[i])
				}
				return e
			},
			a = function () {
				function i(e, t) {
					for (var n = 0; n < t.length; n++) {
						var i = t[n];
						i.enumerable = i.enumerable || !1, i.configurable = !0, "value" in i && (i.writable = !0), Object.defineProperty(e, i.key, i)
					}
				}
				return function (e, t, n) {
					return t && i(e.prototype, t), n && i(e, n), e
				}
			}();
		var u = Symbol("onQuickviewShowClick"),
			l = Symbol("onQuickviewDismissClick"),
			r = function (e) {
				function r(e) {
					var t = 1 < arguments.length && void 0 !== arguments[1] ? arguments[1] : {};
					! function (e, t) {
						if (!(e instanceof t)) throw new TypeError("Nao e possivel chamar uma classe como uma funcao")
					}(this, r);
					var n = function (e, t) {
						if (!e) throw new ReferenceError("isso nao foi inicializado - super () nao foi chamado");
						return !t || "object" != typeof t && "function" != typeof t ? e : t
					}(this, (r.__proto__ || Object.getPrototypeOf(r)).call(this));
					if (n.element = "string" == typeof e ? document.querySelector(e) : e, !n.element) throw new Error("Um seletor invalido ou um no nao-DOM foi fornecido");
					return n._clickEvents = ["click"], n.options = s({}, o.a, t), n[u] = n[u].bind(n), n[l] = n[l].bind(n), n.init(), n
				}
				return function (e, t) {
					if ("function" != typeof t && null !== t) throw new TypeError("Super expressao deve ser nula ou uma funcao, nao " + typeof t);
					e.prototype = Object.create(t && t.prototype, {
						constructor: {
							value: e,
							enumerable: !1,
							writable: !0,
							configurable: !0
						}
					}), t && (Object.setPrototypeOf ? Object.setPrototypeOf(e, t) : e.__proto__ = t)
				}(r, i["a"]), a(r, [{
					key: "init",
					value: function () {
						this.quickview = document.getElementById(this.element.dataset.target), this.dismissElements = document.querySelectorAll('[data-dismiss="quickview"]'), this._bindEvents(), this.emit("quickview:ready", {
							element: this.element,
							quickview: this.quickview
						})
					}
				}, {
					key: "_bindEvents",
					value: function () {
						var n = this;
						this._clickEvents.forEach(function (e) {
							n.element.addEventListener(e, n[u], !1)
						}), [].forEach.call(this.dismissElements, function (t) {
							n._clickEvents.forEach(function (e) {
								t.addEventListener(e, n[l], !1)
							})
						})
					}
				}, {
					key: u,
					value: function (e) {
						this.quickview.classList.add("is-active"), this.emit("quickview:show", {
							element: this.element,
							quickview: this.quickview
						})
					}
				}, {
					key: l,
					value: function (e) {
						this.quickview.classList.remove("is-active"), this.emit("quickview:hide", {
							element: this.element,
							quickview: this.quickview
						})
					}
				}], [{
					key: "attach",
					value: function () {
						var e = 0 < arguments.length && void 0 !== arguments[0] ? arguments[0] : '[data-show="quickview"]',
							t = 1 < arguments.length && void 0 !== arguments[1] ? arguments[1] : {},
							n = new Array,
							i = document.querySelectorAll(e);
						return [].forEach.call(i, function (e) {
							setTimeout(function () {
								n.push(new r(e, t))
							}, 100)
						}), n
					}
				}]), r
			}();
		t.default = r
	}, function (e, t, n) {
		'use strict';
		var i = function () {
			function i(e, t) {
				for (var n = 0; n < t.length; n++) {
					var i = t[n];
					i.enumerable = i.enumerable || !1, i.configurable = !0, "value" in i && (i.writable = !0), Object.defineProperty(e, i.key, i)
				}
			}
			return function (e, t, n) {
				return t && i(e.prototype, t), n && i(e, n), e
			}
		}();
		var r = function () {
			function t() {
				var e = 0 < arguments.length && void 0 !== arguments[0] ? arguments[0] : [];
				! function (e, t) {
					if (!(e instanceof t)) throw new TypeError("Nao e possivel chamar uma classe como uma funcao")
				}(this, t), this._listeners = new Map(e), this._middlewares = new Map
			}
			return i(t, [{
				key: "listenerCount",
				value: function (e) {
					return this._listeners.has(e) ? this._listeners.get(e).length : 0
				}
			}, {
				key: "removeListeners",
				value: function () {
					var t = this,
						e = 0 < arguments.length && void 0 !== arguments[0] ? arguments[0] : null,
						n = 1 < arguments.length && void 0 !== arguments[1] && arguments[1];
					null !== e ? Array.isArray(e) ? name.forEach(function (e) {
						return t.removeListeners(e, n)
					}) : (this._listeners.delete(e), n && this.removeMiddleware(e)) : this._listeners = new Map
				}
			}, {
				key: "middleware",
				value: function (e, t) {
					var n = this;
					Array.isArray(e) ? name.forEach(function (e) {
						return n.middleware(e, t)
					}) : (Array.isArray(this._middlewares.get(e)) || this._middlewares.set(e, []), this._middlewares.get(e).push(t))
				}
			}, {
				key: "removeMiddleware",
				value: function () {
					var t = this,
						e = 0 < arguments.length && void 0 !== arguments[0] ? arguments[0] : null;
					null !== e ? Array.isArray(e) ? name.forEach(function (e) {
						return t.removeMiddleware(e)
					}) : this._middlewares.delete(e) : this._middlewares = new Map
				}
			}, {
				key: "on",
				value: function (e, t) {
					var n = this,
						i = 2 < arguments.length && void 0 !== arguments[2] && arguments[2];
					if (Array.isArray(e)) e.forEach(function (e) {
						return n.on(e, t)
					});
					else {
						var r = (e = e.toString()).split(/,|, | /);
						1 < r.length ? r.forEach(function (e) {
							return n.on(e, t)
						}) : (Array.isArray(this._listeners.get(e)) || this._listeners.set(e, []), this._listeners.get(e).push({
							once: i,
							callback: t
						}))
					}
				}
			}, {
				key: "once",
				value: function (e, t) {
					this.on(e, t, !0)
				}
			}, {
				key: "emit",
				value: function (n, i) {
					var r = this,
						o = 2 < arguments.length && void 0 !== arguments[2] && arguments[2];
					n = n.toString();
					var s = this._listeners.get(n),
						a = null,
						u = 0,
						l = o;
					if (Array.isArray(s))
						for (s.forEach(function (e, t) {
								o || (a = r._middlewares.get(n), Array.isArray(a) ? (a.forEach(function (e) {
									e(i, function () {
										var e = 0 < arguments.length && void 0 !== arguments[0] ? arguments[0] : null;
										null !== e && (i = e), u++
									}, n)
								}), u >= a.length && (l = !0)) : l = !0), l && (e.once && (s[t] = null), e.callback(i))
							}); - 1 !== s.indexOf(null);) s.splice(s.indexOf(null), 1)
				}
			}]), t
		}();
		t.a = r
	}, function (e, t, n) {
		'use strict';
		t.a = {}
	}]).default
});;;

// CRIA CAMPO TAGS --------------------------------------------------------------------------------
(function (global, factory) {
	typeof exports === 'object' && typeof module !== 'undefined' ? module.exports = factory() :
	typeof define === 'function' && define.amd ? define('mkaTagsinput', factory) :
	(global.mkaTagsinput = factory());
}(this, (function () { 'use strict';

if (typeof Object.assign != 'function') {
Object.defineProperty(Object, "assign", {
	value: function assign(target, varArgs) {
	'use strict';
	if (target == null) {
		throw new TypeError('Cannot convert undefined or null to object');
	}

	var to = Object(target);

	for (var index = 1; index < arguments.length; index++) {
		var nextSource = arguments[index];

		if (nextSource != null) {
		for (var nextKey in nextSource) {
			if (Object.prototype.hasOwnProperty.call(nextSource, nextKey)) {
			to[nextKey] = nextSource[nextKey];
			}
		}
		}
	}
	return to;
	},
	writable: true,
	configurable: true
});
}

const MOUSE_EVENTS = ['click', 'touchstart'];

const KEY_BACKSPACE = 8;
const KEY_TAB = 9;
const KEY_ENTER = 13;
const KEY_LEFT = 37;
const KEY_RIGHT = 39;
const KEY_DELETE = 46;
const KEY_COMMA = 188;

class Tagify {
constructor(element, options = {}) {
	let defaultOptions = {
	disabled: false,
	delimiter: ',',
	allowDelete: true,
	lowercase: false,
	uppercase: false,
	duplicates: true
	};
	this.element = element;
	this.options = Object.assign({}, defaultOptions, options);

	this.init();
}

init() {
	if (!this.options.disabled) {
	this.tags = [];
	this.container = document.createElement('div');
	this.container.className = 'tagsinput';
	this.container.classList.add('field');
	this.container.classList.add('is-grouped');
	this.container.classList.add('is-grouped-multiline');
	this.container.classList.add('input');

	let inputType = this.element.getAttribute('type');
		if (!inputType || inputType === 'tags') {
			inputType = 'text';
	}
	this.input = document.createElement('input');
	this.input.setAttribute('type', inputType);
	if (this.element.getAttribute('placeholder')) {
		this.input.setAttribute('placeholder', this.element.getAttribute('placeholder'));
	} else {
		this.input.setAttribute('placeholder', 'Add a Tag');
	}
	this.container.appendChild(this.input);

	let sib = this.element.nextSibling;
	this.element.parentNode[sib ? 'insertBefore':'appendChild'](this.container, sib);
	this.element.style.cssText = 'position:absolute;left:0;top:0;width:1px;height:1px;opacity:0.01;';
	this.element.tabIndex = -1;

	this.enable();
	}
}

enable() {
	if (!this.enabled && !this.options.disabled) {

	this.element.addEventListener('focus', () => {
		this.container.classList.add('is-focused');
		this.select((Array.prototype.slice.call(this.container.querySelectorAll('.tag:not(.is-delete)'))).pop());
	});

	this.input.addEventListener('focus', () => {
			this.container.classList.add('is-focused');
			this.select((Array.prototype.slice.call(this.container.querySelectorAll('.tag:not(.is-delete)'))).pop());
	});
	this.input.addEventListener('blur', () => {
			this.container.classList.remove('is-focused');
			this.select((Array.prototype.slice.call(this.container.querySelectorAll('.tag:not(.is-delete)'))).pop());
			this.savePartial();
	});
	this.input.addEventListener('keydown', (e) => {
		let key = e.charCode || e.keyCode || e.which,
		selectedTag,
		activeTag = this.container.querySelector('.tag.is-active'),
		last = (Array.prototype.slice.call(this.container.querySelectorAll('.tag:not(.is-delete)'))).pop(),
		atStart = this.caretAtStart(this.input);

		if (activeTag) {
		selectedTag = this.container.querySelector('[data-tag="' + activeTag.innerHTML.trim() + '"]');
		}
		this.setInputWidth();

		if (key === KEY_ENTER || key === this.options.delimiter.charCodeAt(0) || key === KEY_COMMA || key === KEY_TAB) {
		if (!this.input.value && (key !== this.options.delimiter.charCodeAt(0) || key === KEY_COMMA)) {
			return;
		}
		this.savePartial();
		} else if (key === KEY_DELETE && selectedTag) {
				if (selectedTag.nextSibling) {
			this.select(selectedTag.nextSibling.querySelector('.tag'));
		} else if (selectedTag.previousSibling) {
			this.select(selectedTag.previousSibling.querySelector('.tag'));
		}
				this.container.removeChild(selectedTag);
		delete this.tags[this.tags.indexOf(selectedTag.getAttribute('data-tag'))];
				this.setInputWidth();
				this.save();
		} else if (key === KEY_BACKSPACE) {
		if (selectedTag) {
			if (selectedTag.previousSibling) {
					this.select(selectedTag.previousSibling.querySelector('.tag'));
			} else if (selectedTag.nextSibling) {
					this.select(selectedTag.nextSibling.querySelector('.tag'));
			}
					this.container.removeChild(selectedTag);
			delete this.tags[this.tags.indexOf(selectedTag.getAttribute('data-tag'))];
					this.setInputWidth();
					this.save();
				} else if (last && atStart) {
					this.select(last);
				} else {
					return;
		}
		} else if (key === KEY_LEFT) {
				if (selectedTag) {
					if (selectedTag.previousSibling) {
						this.select(selectedTag.previousSibling.querySelector('.tag'));
					}
				} else if (!atStart) {
					return;
				} else {
					this.select(last);
				}
			}
			else if (key === KEY_RIGHT) {
				if (!selectedTag) {
			return;
		}
				this.select(selectedTag.nextSibling.querySelector('.tag'));
			}
			else {
				return this.select();
		}

		e.preventDefault();
		return false;
	});
	this.input.addEventListener('input', () => {
		this.element.value = this.getValue();
		this.element.dispatchEvent(new Event('input'));
	});
	this.input.addEventListener('paste', () => setTimeout(savePartial, 0));

	this.container.addEventListener('mousedown', (e) => { this.refocus(e); });
	this.container.addEventListener('touchstart', (e) => { this.refocus(e); });

	this.savePartial(this.element.value);

	this.enabled = true;
	}
}

disable() {
	if (this.enabled && !this.options.disabled) {
	this.reset();

	this.enabled = false;
	}
}

select(el) {
		let sel = this.container.querySelector('.is-active');
		if (sel) {
	sel.classList.remove('is-active');
	}
		if (el) {
	el.classList.add('is-active');
	}
}

addTag(text) {
	if (~text.indexOf(this.options.delimiter)) {
	text = text.split(this.options.delimiter);
	}
	if (Array.isArray(text)) {
	return text.forEach((text) => {
		this.addTag(text);
	});
	}

	let tag = text && text.trim();
	if (!tag) {
	return false;
	}

	if (this.element.getAttribute('lowercase') || this.options['lowercase'] == 'true') {
	tag = tag.toLowerCase();
	}
	if (this.element.getAttribute('uppercase') || this.options['uppercase'] == 'true') {
	tag = tag.toUpperCase();
	}
	if (this.element.getAttribute('duplicates') == 'true' || this.options['duplicates'] || this.tags.indexOf(tag) === -1) {
	this.tags.push(tag);

	let newTagWrapper = document.createElement('div');
	newTagWrapper.className = 'control';
	newTagWrapper.setAttribute('data-tag', tag);

	let newTag = document.createElement('div');
	newTag.className = 'tags';
	newTag.classList.add('has-addons');

	let newTagContent = document.createElement('span');
	newTagContent.className = 'tag';
	newTagContent.classList.add('is-active');
	this.select(newTagContent);
	newTagContent.innerHTML = tag;

	newTag.appendChild(newTagContent);
	if (this.options.allowDelete) {
		let newTagDeleteButton = document.createElement('a');
		newTagDeleteButton.className = 'tag';
		newTagDeleteButton.classList.add('is-delete');
		MOUSE_EVENTS.forEach((event) => {
		newTagDeleteButton.addEventListener(event, (e) => {
		let selectedTag,
			activeTag = e.target.parentNode,
			last = (Array.prototype.slice.call(this.container.querySelectorAll('.tag'))).pop(),
			atStart = this.caretAtStart(this.input);

		if (activeTag) {
			selectedTag = this.container.querySelector('[data-tag="' + activeTag.innerText.trim() + '"]');
		}

		if (selectedTag) {
					this.select(selectedTag.previousSibling);
					this.container.removeChild(selectedTag);
			delete this.tags[this.tags.indexOf(selectedTag.getAttribute('data-tag'))];
					this.setInputWidth();
					this.save();
				}
				else if (last && atStart) {
					this.select(last);
				}
				else {
					return;
		}
		});
	});
		newTag.appendChild(newTagDeleteButton);
	}
	newTagWrapper.appendChild(newTag);

	this.container.insertBefore(newTagWrapper, this.input);
	}
}

getValue() {
	return this.tags.join(this.options.delimiter);
}

setValue(value) {
	(Array.prototype.slice.call(this.container.querySelectorAll('.tag'))).forEach((tag) => {
	delete this.tags[this.tags.indexOf(tag.innerHTML)];
	this.container.removeChild(tag);
	});
	this.savePartial(value);
}

setInputWidth() {
	let last = (Array.prototype.slice.call(this.container.querySelectorAll('.control'))).pop();

	if (!this.container.offsetWidth) {
	return;
	}
	this.input.style.width = Math.max(this.container.offsetWidth - (last ? (last.offsetLeft + last.offsetWidth) : 30) - 30, this.container.offsetWidth / 4) + 'px';
}

savePartial(value) {
	if (typeof value !== 'string' && !Array.isArray(value)) {
	value = this.input.value;
	}
	if (this.addTag(value) !== false) {
			this.input.value = '';
			this.save();
			this.setInputWidth();
	}
}

save() {
	this.element.value = this.tags.join(this.options.delimiter);
	this.element.dispatchEvent(new Event('change'));
}

caretAtStart(el) {
		try {
			return el.selectionStart === 0 && el.selectionEnd === 0;
		}
		catch(e) {
			return el.value === '';
		}
}

refocus(e) {
		if (e.target.classList.contains('tag')) {
	this.select(e.target);
	}
		if (e.target === this.input) {
	return this.select();
	}
		this.input.focus();
		e.preventDefault();
		return false;
}

reset() {
	this.tags = [];
}

destroy() {
	this.disable();
	this.reset();
	this.element = null;
}
}

document.addEventListener( 'DOMContentLoaded', function () {
let tagInputs = document.querySelectorAll('input[type="tags"]');
[].forEach.call(tagInputs, function(tagInput) {
	new Tagify(tagInput);
});
});

return Tagify;

})));;;

// FLEXBOX TOAST ----------------------------------------------------------------------------------
(function(a, b) {
	'object' == typeof exports && 'undefined' != typeof module ? b(exports) : 'function' == typeof define && define.amd ? define(['exports'], b) : b(a.mkaToast = {})
})(this, function(a) {
	'use strict';

	function b() {
		g = {
			noticesTopLeft: i.createElement('div'),
			noticesTopRight: i.createElement('div'),
			noticesBottomLeft: i.createElement('div'),
			noticesBottomRight: i.createElement('div'),
			noticesTopCenter: i.createElement('div'),
			noticesBottomCenter: i.createElement('div'),
			noticesCenter: i.createElement('div')
		};

		for (let a in g.noticesTopLeft.setAttribute('style', `${'width:100%;z-index:99999;position:fixed;pointer-events:none;display:flex;flex-direction:column;padding:15px;'}left:0;top:0;text-align:left;align-items:flex-start;`), g.noticesTopRight.setAttribute('style', `${'width:100%;z-index:99999;position:fixed;pointer-events:none;display:flex;flex-direction:column;padding:15px;'}right:0;top:0;text-align:right;align-items:flex-end;`), g.noticesBottomLeft.setAttribute('style', `${'width:100%;z-index:99999;position:fixed;pointer-events:none;display:flex;flex-direction:column;padding:15px;'}left:0;bottom:0;text-align:left;align-items:flex-start;`), g.noticesBottomRight.setAttribute('style', `${'width:100%;z-index:99999;position:fixed;pointer-events:none;display:flex;flex-direction:column;padding:15px;'}right:0;bottom:0;text-align:right;align-items:flex-end;`), g.noticesTopCenter.setAttribute('style', `${'width:100%;z-index:99999;position:fixed;pointer-events:none;display:flex;flex-direction:column;padding:15px;'}top:0;left:0;right:0;text-align:center;align-items:center;`), g.noticesBottomCenter.setAttribute('style', `${'width:100%;z-index:99999;position:fixed;pointer-events:none;display:flex;flex-direction:column;padding:15px;'}bottom:0;left:0;right:0;text-align:center;align-items:center;`), g.noticesCenter.setAttribute('style', `${'width:100%;z-index:99999;position:fixed;pointer-events:none;display:flex;flex-direction:column;padding:15px;'}top:0;left:0;right:0;bottom:0;flex-flow:column;justify-content:center;align-items:center;`), g) i.body.appendChild(g[a]);

		h = {
			"top-left": g.noticesTopLeft,
			"top-right": g.noticesTopRight,
			"top-center": g.noticesTopCenter,
			"bottom-left": g.noticesBottomLeft,
			"bottom-right": g.noticesBottomRight,
			"bottom-center": g.noticesBottomCenter,
			center: g.noticesCenter
		}, f = !0
	}

	function c(a) {
		f || b();
		let c = Object.assign({}, e, a);
		const d = new j(c),
			g = h[c.position] || h[e.position];
		g.appendChild(d.element)
	}

	function d(a) {
		for (let b in g) {
			let a = g[b];
			a.parentNode.removeChild(a)
		}
		i = a, b()
	}

	const e = {
		message: 'Mensagem padrao do sistema',
		duration: 2e3,
		position: 'top-right',
		closeOnClick: !0,
		opacity: 1
	};

	let f = !1,
		g = {},
		h = {},
		i = document;
	class j {
		constructor(a) {
			this.element = i.createElement('div'), this.opacity = a.opacity, this.type = a.type, this.animate = a.animate, this.dismissible = a.dismissible, this.closeOnClick = a.closeOnClick, this.message = a.message, this.duration = a.duration, this.pauseOnHover = a.pauseOnHover;
			let b = `width:auto;pointer-events:auto;display:inline-flex;opacity:${this.opacity};`,
				c = ['notification'];
			if (this.type && c.push(this.type), this.animate && this.animate.in && (c.push(`animated ${this.animate.in}`), this.onAnimationEnd(() => this.element.classList.remove(this.animate.in))), this.element.className = c.join(' '), this.dismissible) {
				let a = i.createElement('button');
				a.className = 'delete', a.addEventListener('click', () => {
					this.destroy()
				}), this.element.insertAdjacentElement('afterbegin', a)
			} else b += 'padding: 1.25rem 1.5rem';
			this.closeOnClick && this.element.addEventListener('click', () => {
				this.destroy()
			}), this.element.setAttribute('style', b), 'string' == typeof this.message ? this.element.insertAdjacentHTML('beforeend', this.message) : this.element.appendChild(this.message);
			const d = new k(() => {
				this.destroy()
			}, this.duration);
			this.pauseOnHover && (this.element.addEventListener('mouseover', () => {
				d.pause()
			}), this.element.addEventListener('mouseout', () => {
				d.resume()
			}))
		}
		destroy() {
			this.animate && this.animate.out ? (this.element.classList.add(this.animate.out), this.onAnimationEnd(() => this.removeChild(this.element))) : this.removeChild(this.element)
		}
		removeChild(a) {
			a.parentNode && a.parentNode.removeChild(a)
		}
		onAnimationEnd(a = () => {}) {
			const b = {
				animation: 'animationend',
				OAnimation: 'oAnimationEnd',
				MozAnimation: 'mozAnimationEnd',
				WebkitAnimation: 'webkitAnimationEnd'
			};
			for (const c in b)
				if (this.element.style[c] !== void 0) {
					this.element.addEventListener(b[c], () => a());
					break
				}
		}
	}

	class k {
		constructor(a, b) {
			this.timer, this.start, this.remaining = b, this.callback = a, this.resume()
		}
		pause() {
			window.clearTimeout(this.timer), this.remaining -= new Date - this.start
		}
		resume() {
			this.start = new Date, window.clearTimeout(this.timer), this.timer = window.setTimeout(this.callback, this.remaining)
		}
	}

	a.toast = c, a.setDoc = d, Object.defineProperty(a, '__esModule', {
		value: !0
	})
});;;

// FUNCOES PARA FORMATCAO DOS CAMPOS --------------------------------------------------------------
function Mascara(objeto, evt, mask) {
	var LetrasU = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
	var LetrasL = 'abcdefghijklmnopqrstuvwxyz';
	var Letras = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
	var LetrasNumeros = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789abcdefghijklmnopqrstuvwxyz';
	var Numeros = '0123456789';
	var Fixos = '().-:/ ';
	var Charset = " !\"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\]^_/`abcdefghijklmnopqrstuvwxyz{|}~";

	evt = (evt) ? evt : (window.event) ? window.event : "";
	var value = objeto.value;
	if (evt) {
		var ntecla = (evt.which) ? evt.which : evt.keyCode;
		tecla = Charset.substr(ntecla - 32, 1);
		if (ntecla < 32) return true;

		var tamanho = value.length;
		if (tamanho >= mask.length) return false;

		var pos = mask.substr(tamanho, 1);
		while (Fixos.indexOf(pos) != -1) {
			value += pos;
			tamanho = value.length;
			if (tamanho >= mask.length) return false;
			pos = mask.substr(tamanho, 1);
		}

		switch (pos) {
		case '#':
			if (Numeros.indexOf(tecla) == -1) return false;
			break;
		case 'N':
			if (LetrasNumeros.indexOf(tecla) == -1) return false;
			break;
		case 'A':
			if (LetrasU.indexOf(tecla) == -1) return false;
			break;
		case 'a':
			if (LetrasL.indexOf(tecla) == -1) return false;
			break;
		case 'Z':
			if (Letras.indexOf(tecla) == -1) return false;
			break;
		case '*':
			objeto.value = value;
			return true;
			break;
		default:
			return false;
			break;
		}
	}
	objeto.value = value;
	return true;
};;;

function MaskHORA(objeto, evt) {
	return Mascara(objeto, evt, '##:##');
}

function MaskCEP(objeto, evt) {
	return Mascara(objeto, evt, '#####-###');
}

function MaskTelefone(objeto, evt) {
	return Mascara(objeto, evt, '(##)####-####');
}

function MaskCelular(objeto, evt) {
	return Mascara(objeto, evt, '(##)#########');
}

function MaskCPF(objeto, evt) {
	return Mascara(objeto, evt, '###.###.###-##');
}

function MaskCNPJ(objeto, evt) {
	return Mascara(objeto, evt, '##.###.###/####-##');
}

function MaskData(objeto, evt) {
	return Mascara(objeto, evt, '##/##/####');
}

function MaskIP(objeto, evt) {
	return Mascara(objeto, evt, '###.###.###.###');
}

function MaskMAC(objeto, evt) {
	return Mascara(objeto, evt, 'NN:NN:NN:NN:NN:NN');
}

function MaskTunel(objeto, evt) {
	return Mascara(objeto, evt, 'NNNN-NNNN-NNNN-NNNN-NNNN');
}

function MaskDataHora(objeto, evt) {
	return Mascara(objeto, evt, '##/##/#### ##:##:##');
}

function MaskCartao(objeto, evt) {
	return Mascara(objeto, evt, '#### #### #### ####');
}

function MaskLinhaDig(objeto, evt) {
	return Mascara(objeto, evt, '#####.##### #####.###### #####.###### # ##############');
}

// FUNCAO EXIBE A CAIXA DE AJUDA ------------------------------------------------------------------
var Help = {
	show: function (message, helpLink) {
		var helpDiv = document.createElement('span');
		helpDiv.className = 'has-text-info';
		helpDiv.appendChild(document.createTextNode(' ' + message));
		helpLink.parentNode.insertBefore(helpDiv, helpLink.nextSibling);
	},

	hide: function (helpLink) {
		helpLink.parentNode.removeChild(helpLink.nextSibling);
	}
};;;

// FUNCAO PARA REDIMENCIONAR PARA FULL SCREEM -----------------------------------------------------
function winSizer() {
	windowWidth = window.screen.availWidth;
	windowHeight = window.screen.availHeight;
	window.moveTo(0, 0);
	window.resizeTo(windowWidth, windowHeight);
};;;

// FUNCAO PARA REDIMENCIONAR JANELA ---------------------------------------------------------------
function redWin(redw, redh) {
	windowWidth = redw;
	windowHeight = redh;
	window.moveTo(0, 0);
	window.resizeTo(windowWidth, windowHeight);
};;;

// FORMATA CAMPOS DE VALOR ------------------------------------------------------------------------
function FormatarValor(campo, tammax, teclapres) {
	var tecla = teclapres.keyCode;
	vr = campo.value;
	vr = vr.replace(/[^\d]*/gi, "");
	tam = vr.length;

	if (tam < tammax && tecla != 8) {
		tam = vr.length + 1;
	}

	if (tecla == 8) {
		tam = tam - 1;
	}

	if (tecla == 8 || tecla >= 48 && tecla <= 57 || tecla >= 96 && tecla <= 105) {
		campo.value = vr.substr(0, tam - 2) + ',' + vr.substr(tam - 2, tam);
	}

	if (tam <= 2) {
		campo.value = vr;
	}

	if ((tam > 2) && (tam <= 5)) {

		if ((tam >= 6) && (tam <= 8)) {
			campo.value = vr.substr(0, tam - 5) + '' + vr.substr(tam - 5, 3) + ',' + vr.substr(tam - 2, tam);
		}
		if ((tam >= 9) && (tam <= 11)) {
			campo.value = vr.substr(0, tam - 8) + '' + vr.substr(tam - 8, 3) + '' + vr.substr(tam - 5, 3) + ',' + vr.substr(tam - 2, tam);
		}
		if ((tam >= 12) && (tam <= 14)) {
			campo.value = vr.substr(0, tam - 11) + '' + vr.substr(tam - 11, 3) + '' + vr.substr(tam - 8, 3) + '' + vr.substr(tam - 5, 3) + ',' + vr.substr(tam - 2, tam);
		}
		if ((tam >= 15) && (tam <= 17)) {
			campo.value = vr.substr(0, tam - 14) + '' + vr.substr(tam - 14, 3) + '' + vr.substr(tam - 11, 3) + '' + vr.substr(tam - 8, 3) + '' + vr.substr(tam - 5, 3) + ',' + vr.substr(tam - 2, tam);
		}

		//limpa zeros a esquerda
		if (campo.value.substr(0, 1) == '0' && campo.value.substr(0, 2) != '0,') campo.value = campo.value.substr(1, tam);
	}
};;;

// CRIA UM LINK -----------------------------------------------------------------------------------
function mka_link(vlink) {
	if (window.event) {

		if (event.ctrlKey) {
			window.open(vlink, '_blank');
		} else if (event.shiftKey) {
			window.open(vlink);
		} else {
			window.location.href = vlink;
		}

	} else {

		window.location.href = vlink;

	}
};;;

// RELOAD DEPOIS DE ALGUNS SEGUNDOS ---------------------------------------------------------------
function reloadAqui() {
	setTimeout("location.reload(true);", 3000);
};;;

// PEGA COORDENADAS NO MAPA -----------------------------------------------------------------------
function mapa_get(callback, servidor) {
	var width = (screen.availWidth - 100);
	var height = (screen.availHeight - 100);
	window.open("mapa_get." + servidor + ".hhvm?retorno=" + callback, "mpg_popup", "toolbar=0, location=0, directories=0, status=1, menubar=0, scrollbars=1, resizable=0, screenX=0, screenY=0, left=0, top=0, width=" + width + ", height=" + height);
	return true;
};;;

// PEGA DADOS UPLOAD ------------------------------------------------------------------------------
function uploadArquivo(validos, campo) {

	var campo_cor = jQuery(campo).parents('div#input_file');
	var campo_txt = jQuery(campo).parents('div#input_file').find('#input_txt');

	if (campo.files.length > 0) {

		jQuery(campo_cor).removeClass("is-info");
		jQuery(campo_cor).removeClass("is-danger");
		jQuery(campo_cor).removeClass("is-primary");

		var arquivo = campo.files[0].name;

		if (validos == '*') {
			
			jQuery(campo_cor).addClass("is-primary");
			jQuery(campo_txt).html(arquivo.substring(0, 22));
			return true;

		}

		extensoes = validos.split('|');
		ext = arquivo.substring(arquivo.lastIndexOf('.')).toLowerCase();
		valido = false;

		for (var i = 0; i <= arquivo.length; i++){
		if (extensoes[i] == ext) {
			valido = true;
			break;
		}
		}

		if (valido) {

			jQuery(campo_cor).addClass("is-info");
			jQuery(campo_txt).html(arquivo);

		} else {

			jQuery(campo_cor).addClass("is-danger");
			jQuery(campo_txt).html(arquivo + ' parece invalido');

		}

	}

};;;

// FECHA CAIXA MODAL ------------------------------------------------------------------------------
function fechar_modal() {
	jQuery(".modal").parents().removeClass("is-clipped");
	jQuery(".modal").removeClass("is-active");
};;;

// ABRE NOVA JANELA -------------------------------------------------------------------------------
function fabrewin(width, height, nameFrame) {
	if (typeof nameFrame == 'undefined') nameFrame = 'mpg_popup';
	window.open("", nameFrame, "toolbar=0, location=0, directories=0, status=1, menubar=0, scrollbars=1, resizable=0, screenX=0, screenY=0, left=0, top=0, width=" + width + ", height=" + height);
	return true;
};;;

// FECHA JANELAS QUICKVIEW ------------------------------------------------------------------------
function fecha_quickview() {
	jQuery("#quickview-pool6").removeClass("is-active");
	jQuery("#quickview-pool4").removeClass("is-active");
	jQuery("#quickview-filter").removeClass("is-active");
	jQuery("#quickview-ips").removeClass("is-active");
	jQuery("#quickview-itens").removeClass("is-active");
	jQuery("#quickview-notas").removeClass("is-active");
	jQuery("#quickview-respostas").removeClass("is-active");
};;;

// CONTROLE DE POOL PD6 ---------------------------------------------------------------------------
function show_pool6() {
	fecha_quickview();

	var config_ramal = sessionStorage.getItem('config_ramal');

	jQuery("#quickview-pool6").addClass("is-active")
	jQuery('#tview_pool6').html('<span class="title">LISTA DE POOLS DE SUBNETS /64</span>');

	jQuery.ajax({
		type: "GET",
		url: "pool_pd6.hhvm?ramal=" + config_ramal,
		beforeSend: function() {
			jQuery('#bview_pool6').html('<img src="img/mkload.gif" hspace="2" vspace="2">');
		},
		success: function(data) {
			jQuery('#bview_pool6').html(data);
		}
	});
};;;

jQuery(document).on('click', '#run_pool_split', function () {
	var v_pool_split = jQuery('#pool_split').val();

	jQuery.ajax({
		type: "POST",
		url: "executar_pd6.hhvm",
		data: "pool_split=" + v_pool_split,
		beforeSend: function() {
			jQuery('#bview_itens').html('<img src="img/mkload.gif" hspace="2" vspace="2">');
		},
		success: function(data) {
			if (data == 'ERROR99') {
				alert('Pool invalido');
				return null;
			}
			if (data == 'ERROR98') {
				alert('Invalido!! use uma /49, /50, /51, /52, /53, /54, /55, /56 ou /57');
				return null;
			}
			// listagem nova
			show_pool6();
		}
	});
});;

function envia_pool6(pool6) {
	var campo_pool6 = sessionStorage.getItem('campo_pool6');
	jQuery('#' + campo_pool6).val(pool6);
	fecha_quickview();
};;;

// CONTROLE DE FILTROS ----------------------------------------------------------------------------
function show_filter(tipo) {
	fecha_quickview();

	jQuery("#quickview-filter").addClass("is-active")
	jQuery('#tview_filter').html('<span class="title">CONFIGURA&#199;&#213;ES</span>');

	jQuery.ajax({
		type: "POST",
		url: "conf_" + tipo + ".hhvm",
		data: "acao=filter",
		beforeSend: function() {
			jQuery('#bview_filter').html('<img src="img/mkload.gif" hspace="2" vspace="2">');
		},
		success: function(data) {
			jQuery('#bview_filter').html(data);
		}
	});
};;;

// CONTROLE DE IPS LIVRES -------------------------------------------------------------------------
function show_ips() {
	fecha_quickview();

	var config_ramal = sessionStorage.getItem('config_ramal');

	jQuery("#quickview-ips").addClass("is-active")
	jQuery('#tview_ips').html('<span class="title">LISTA DE IPS</span>');

	jQuery.ajax({
		type: "GET",
		url: "iplivres.hhvm?ramal=" + config_ramal,
		beforeSend: function() {
			jQuery('#bview_ips').html('<img src="img/mkload.gif" hspace="2" vspace="2">');
		},
		success: function(data) {
			jQuery('#bview_ips').html(data);
		}
	});
};;;

jQuery(document).on('click', '#btn_listar_ip', function () {
	var v_ipinicial = jQuery('#txt_ipinicial').val();
	var v_ipfinal = jQuery('#txt_ipfinal').val();

	jQuery.ajax({
		type: "POST",
		url: "executar_ip.hhvm",
		data: "ipinicial=" + v_ipinicial + "&ipfinal=" + v_ipfinal,
		beforeSend: function() {
			jQuery('#bview_itens').html('<img src="img/mkload.gif" hspace="2" vspace="2">');
		},
		success: function(data) {
			if (data == 'ERROR99') {
				alert('ip inicial invalido');
				return null;
			}
			if (data == 'ERROR98') {
				alert('ip final invalido');
				return null;
			}
			if (data == 'ERROR97') {
				alert('ip inicial maior do que final');
				return null;
			}
			// listagem nova
			show_ips();
		}
	});
});;;

function envia_ip(valorip) {
	var campo_ip = sessionStorage.getItem('campo_ip');
	jQuery('#' + campo_ip).val(valorip);
	fecha_quickview();
};;;

// CONTROLE DE PILHAS -----------------------------------------------------------------------------
function envia_pilha(id, ip_rede, barra_64) {
	var campo_ip = sessionStorage.getItem('campo_ip');
	var campo_pool6 = sessionStorage.getItem('campo_pool6');
	jQuery('#' + campo_ip).val(ip_rede);
	jQuery('#' + campo_pool6).val(barra_64);
	fecha_quickview();
};;;

// CONTROLE DE ITENS ------------------------------------------------------------------------------
function itens_listar(v_op, v_campo) {
	fecha_quickview();

	jQuery("#quickview-itens").addClass("is-active")
	jQuery('#tview_itens').html('<span class="title">ITENS CADASTRADOS</span>');

	jQuery.ajax({
		type: "GET",
		url: "itens.hhvm",
		data: "op=" + v_op + "&campo=" + v_campo + "&acao=list_item",
		beforeSend: function() {
			jQuery('#bview_itens').html('<img src="img/mkload.gif" hspace="2" vspace="2">');
		},
		success: function(data) {
			jQuery('#bview_itens').html(data);

			// troca valores
			jQuery('#item_op').val(v_op);
			jQuery('#item_campo').val(v_campo);
		}
	});
};;;

jQuery(document).on('click', '.itens_listar', function () {
	var v_op = jQuery(this).attr("data-item-op");
	var v_campo = jQuery(this).attr("data-item-campo");
	itens_listar(v_op, v_campo);
});;;

function itens_inserir(v_op, v_campo, txt_item) {
	if (txt_item != "") {
		jQuery.ajax({
			type: "GET",
			url: "itens.hhvm",
			data: "op=" + v_op + "&campo=" + v_campo + "&item=" + txt_item + "&acao=ins_item",
			beforeSend: function() {
				jQuery('#bview_itens').html('<img src="img/mkload.gif" hspace="2" vspace="2">');
			},
			success: function(data) {
				jQuery('#' + v_campo).append('<option value="' + txt_item + '"> ' + txt_item + ' </option>');
				fecha_quickview();

				// troca valores
				jQuery('#' + v_campo).val(txt_item);
			}
		});
	}
};;;

jQuery(document).on('click', '#itens_inserir', function () {
	var v_op = jQuery('#item_op').val();
	var v_campo = jQuery('#item_campo').val();
	var txt_item = jQuery('#txt_item').val();

	itens_inserir(v_op, v_campo, txt_item);
});;;

jQuery(document).on('click', '#txt_item', function () {
	jQuery(document).keypress(function(f) {
		if (f.which == 13) {
			var v_op = jQuery('#item_op').val();
			var v_campo = jQuery('#item_campo').val();
			var txt_item = jQuery('#txt_item').val();

			itens_inserir(v_op, v_campo, txt_item);
		}
	});
});;;

function itens_deletar(v_op, v_campo, item_uuid) {
	jQuery.ajax({
		type: "GET",
		url: "itens.hhvm",
		data: "op=" + v_op + "&campo=" + v_campo + "&item=" + item_uuid + "&acao=del_item",
		beforeSend: function() {
			jQuery('#bview_itens').html('<img src="img/mkload.gif" hspace="2" vspace="2">');
		},
		success: function(data) {
			jQuery('#bview_itens').html(data);
		}
	});
};;;

jQuery(document).on('click', '#itens_deletar', function () {
	var v_op = jQuery(this).attr("data-item-op");
	var v_campo = jQuery(this).attr("data-item-campo");
	var item_uuid = jQuery(this).attr("data-item-uuid");

	itens_deletar(v_op, v_campo, item_uuid);
});;;

function itens_selecionar(v_campo, item_nome) {
	fecha_quickview();

	// troca valores
	jQuery('#' + v_campo + ' option[value="' + item_nome + '"]').remove();
	jQuery('#' + v_campo).append('<option value="' + item_nome + '" selected> ' + item_nome + ' </option>');
};;;

jQuery(document).on('click', '#itens_selecionar', function () {
	var v_campo = jQuery(this).attr("data-item-campo");
	var item_nome = jQuery(this).attr("data-item-nome");

	itens_selecionar(v_campo, item_nome);
});;;

// CONTROLE DE NOTAS ------------------------------------------------------------------------------
function notas_listar(v_token) {
	fecha_quickview();

	jQuery("#quickview-notas").addClass("is-active")
	jQuery('#tview_notas').html('<span class="title">NOTAS CADASTRADAS</span>');

	jQuery.ajax({
		type: "GET",
		url: "notas.hhvm",
		data: "token=" + v_token,
		beforeSend: function() {
			jQuery('#bview_notas').html('<img src="img/mkload.gif" hspace="2" vspace="2">');
		},
		success: function(data) {
			jQuery('#bview_notas').html(data);

			// troca valores
			jQuery('#token_nota').val(v_token);
		}
	});
};;;

jQuery(document).on('click', '#notas_listar', function () {
	var v_token = jQuery(this).attr("data-nota-token");
	notas_listar(v_token);
});;;

function notas_inserir(v_token, v_nota, v_modo, v_file) {
	if (v_nota !== "") {
		var formData = new FormData();
		formData.append('token', v_token);
		formData.append('texto', baze64_encode(v_nota));
		formData.append('pub', v_modo);
		if (v_file) {
			formData.append('anexo', v_file);
		}

		jQuery.ajax({
			type: "POST",
			url: "notas.hhvm?acao=new_nota",
			data: formData,
			contentType: false,
			processData: false,
			beforeSend: function() {
				jQuery('#bview_notas').html('<img src="img/mkload.gif" hspace="2" vspace="2">');
			},
			success: function(data) {
				jQuery('#bview_notas').html(data);
				jQuery('#txt_nota').val('');
				jQuery('#modo_nota option[value="0"]').removeAttr("selected");
				jQuery('#modo_nota option[value="1"]').attr({ selected: "selected" });
				jQuery('#anexo').val('');
				jQuery('#input_txt').text('nome do arquivo');
			},
			error: function(xhr, status, error) {
				console.error('Erro ao enviar nota:', error);
				jQuery('#bview_notas').html('<p>Erro ao salvar a nota. Tente novamente.</p>');
			}
		});
	}
};;;

jQuery(document).on('click', '#notas_inserir', function () {
    var v_token = jQuery('#token_nota').val();
    var v_nota = nl2br(jQuery('#txt_nota').val());
    var v_modo = jQuery('#modo_nota').val();
    var v_file = jQuery('#anexo')[0].files[0];
    notas_inserir(v_token, v_nota, v_modo, v_file);
});;;

function notas_deletar(nota_id) {
	var v_token = jQuery('#token_nota').val();

	jQuery.ajax({
		type: "GET",
		url: "notas.hhvm",
		data: "token=" + v_token + "&id=" + nota_id + "&acao=del_nota",
		beforeSend: function() {
			jQuery('#bview_notas').html('<img src="img/mkload.gif" hspace="2" vspace="2">');
		},
		success: function(data) {
			jQuery('#bview_notas').html(data);
		}
	});
};;;

jQuery(document).on('click', '#notas_deletar', function () {
	var nota_id = jQuery(this).attr("data-nota-id");
	notas_deletar(nota_id);
});;;

// CONTROLE DE RESPOSTAS NO SUPORTE ---------------------------------------------------------------
function suporte_listar(var_chamado) {
	fecha_quickview();

	jQuery("#quickview-respostas").addClass("is-active")
	jQuery('#tview_respostas').html('<span class="title">RESPOSTAS ' + var_chamado + '</span>');

	jQuery.ajax({
		type: "GET",
		url: "suporte_responder.hhvm",
		data: "chamado=" + var_chamado,
		beforeSend: function() {
			jQuery('#bview_respostas').html('<img src="img/mkload.gif" hspace="2" vspace="2">');
		},
		success: function(data) {
			jQuery('#bview_respostas').html(data);
			document.getElementById("suporteView").scrollIntoView();
			// troca valores
			jQuery('#txt_suporte').val(null);
			jQuery('#token_suporte').val(var_chamado);
		}
	});
};;;

jQuery(document).on('click', '#suporte_listar', function () {
	var var_chamado = jQuery(this).attr("data-chamado");
	suporte_listar(var_chamado);
});;;

var isEnviado = false;
function suporte_inserir(var_chamado, var_msg) {
	if (var_msg != '' && isEnviado == false) {
		isEnviado = true;
		jQuery.ajax({
			type: "GET",
			url: "suporte_responder.hhvm?acao=new_resp&chamado=" + var_chamado + "&msg=" + var_msg,
			beforeSend: function() {
				jQuery('#bview_respostas').html('<img src="img/mkload.gif" hspace="2" vspace="2">');
			},
			success: function(data) {
				jQuery('#bview_respostas').html(data);
				document.getElementById("suporteView").scrollIntoView();
				// troca valores
				jQuery('#txt_suporte').val(null);
			},
			complete: function() {
				isEnviado = false;
			}
		});
	}
};;;

jQuery(document).on('focus', '#txt_suporte', function () {
	jQuery(document).keypress(function(e) {
		if (e.which == 13) jQuery("#suporte_inserir").trigger('click');
	});
});;;

jQuery(document).on('click', '#suporte_inserir', function () {
	var var_chamado = jQuery('#token_suporte').val();
	var var_msg = jQuery('#txt_suporte').val();
	suporte_inserir(var_chamado, var_msg);
});;;

// VALIDA DADOS DO FORMULARIO ---------------------------------------------------------------------
const valida_cpfcnpj = function(val) {
	var val = val.trim();
	val = val.replace(/\./g, '');
	val = val.replace('-', '');
	val = val.replace('/', ''); 
	val = val.split('');
	if (val.length <= 11) {
		var cpf = val;
		var v1 = 0;
		var v2 = 0;
		var aux = false;
		for (var i = 1; cpf.length > i; i++) {
		if (cpf[i - 1] != cpf[i]) aux = true;
		} 
		if (aux == false) return false;
		for (var i = 0, p = 10; (cpf.length - 2) > i; i++, p--) {
		v1 += cpf[i] * p;
		}
		v1 = ((v1 * 10) % 11);
		if (v1 == 10) v1 = 0;
		if (v1 != cpf[9]) return false;
		for (var i = 0, p = 11; (cpf.length - 1) > i; i++, p--) {
		v2 += cpf[i] * p; 
		} 
		v2 = ((v2 * 10) % 11);
		if (v2 == 10) v2 = 0;
		if (v2 != cpf[10]) {
			return false;
		} else {   
			return true;
		}
	} else {
		var cnpj = val; 
		var v1 = 0;
		var v2 = 0;
		var aux = false;
		for (var i = 1; cnpj.length > i; i++) {
		if (cnpj[i - 1] != cnpj[i]) aux = true;
		} 
		if (aux == false) return false;
		for (var i = 0, p1 = 5, p2 = 13; (cnpj.length - 2) > i; i++, p1--, p2--) {
		if (p1 >= 2) {
			v1 += cnpj[i] * p1;
		} else {
			v1 += cnpj[i] * p2;
		}
		}
		v1 = (v1 % 11);
		if (v1 < 2) {
			v1 = 0; 
		} else {
			v1 = (11 - v1);
		}
		if (v1 != cnpj[12]) return false;
		for (var i = 0, p1 = 6, p2 = 14; (cnpj.length - 1) > i; i++, p1--, p2--) {
		if (p1 >= 2) {
			v2 += cnpj[i] * p1;
		} else {
			v2 += cnpj[i] * p2;
		} 
		}
		v2 = (v2 % 11);
		if (v2 < 2) {
			v2 = 0;
		} else {
			v2 = (11 - v2);
		} 
		if (v2 != cnpj[13]) {
			return false; 
		} else {
			return true;
		}
	}
};;;

const valida_mac = function(String) {
	var regex = /^([0-9A-F]{2}[:-]){5}[0-9A-F]{2}$/i;
	if (!regex.test(String)) {
		return false;
	} else {
		return true;
	}
};;;

const valida_ipv4 = function(String) {
	if (/^(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]|[0-9]?)$/.test(String)) {
		return true
	} else {
		return false
	}
};;;

function verifica_form(form) {
	var campo
	for (var i = 0; i < form.length; i++) {
	campo = form[i].getAttribute("name");

	jQuery(form[campo]).removeClass("is-danger");

	if (form[i].getAttribute("df_verificar") == "sim") {

		if (form[i].getAttribute("type") == "text" |
			form[i].getAttribute("type") == "textarea" |
			form[i].getAttribute("type") == "password" |
			form[i].getAttribute("type") == "email" |
			form[i].getAttribute("type") == "url") {

			if (form[i].value == "" |
				form[i].value == "http://" |
				form[i].value == "https://") {

				mkaToast.toast(
					{
						type: 'is-danger',
						message: '<p>Preencha todos os campos requeridos corretamente.</p>',
						position: "top-center",
						dismissible: false,
						duration: 3000,
						pauseOnHover: true,
					}
				);

				jQuery(form[campo]).addClass("is-danger");
				jQuery(form[campo]).focus();

				return false;

			}

		}

		var msg = ""

		if (form[campo].getAttribute("df_validar") == "receita") {
			if (valida_cpfcnpj(form[campo].value) == false) msg = 'Informe corretamente CPF ou CNPJ.';
		}

		if (form[campo].getAttribute("df_validar") == "mac") {
			if (valida_mac(form[campo].value) == false) msg = "Informe corretamente endereco MAC.";
		}

		if (form[campo].getAttribute("df_validar") == "ipv4") {
			if (valida_ipv4(form[campo].value) == false) msg = "Informe corretamente endereco IP.";
		}

		if (msg != "") {

			mkaToast.toast(
				{
					type: 'is-danger',
					message: '<p>' + msg + '</p>',
					position: "top-center",
					dismissible: false,
					duration: 3000,
					pauseOnHover: true,
				}
			);

			jQuery(form[campo]).addClass("is-danger");
			jQuery(form[campo]).focus();

			return false;

		}

	}

	}

	return true;
};;;

// ALERTA TOPO DO SISTEMA -------------------------------------------------------------------------
function alerta_topo1(mensagem) {
	mkaToast.toast(
		{
			type: 'is-danger',
			message: '<h4>' + mensagem + '</h4>',
			position: "top-center",
			dismissible: true,
			duration: 9000,
			pauseOnHover: true,
		}
	);
};;;

function alerta_topo2(mensagem) {
	mkaToast.toast(
		{
			type: 'is-danger',
			message: '<h5>' + mensagem + '</h5>',
			position: "top-right",
			dismissible: true,
			duration: 7000,
			pauseOnHover: true,
		}
	);
};;;

// ALERTA EMBAIXO DO SISTEMA ----------------------------------------------------------------------
function alerta_baixo1(mensagem) {
	var tamanho = mensagem.length;
	if (tamanho >= 33) {
		mkaToast.toast(
			{
				type: 'is-info',
				message: '<h3>' + mensagem + '</h3>',
				position: "bottom-center",
				dismissible: false,
				duration: 3000,
				pauseOnHover: true,
			}
		);
	} else {
		mkaToast.toast(
			{
				type: 'is-dark',
				message: '<p>' + mensagem + '</p>',
				position: "bottom-center",
				dismissible: false,
				duration: 2000,
				pauseOnHover: true,
			}
		);
	}
};;;

function alerta_baixo2(mensagem) {
	mkaToast.toast(
		{
			type: 'is-danger',
			message: '<h5>' + mensagem + '</h5>',
			position: "bottom-center",
			dismissible: false,
			duration: 7000,
			pauseOnHover: true,
		}
	);
};;;

// EVENTOS PERSONALIZADO --------------------------------------------------------------------------
function eventosBOT(sURL) {
	var source = new EventSource(sURL);

	source.addEventListener("sessoes", function(event) {
		app_info.UUE_SESSOES('0' + event.data);
	}, false);

	source.addEventListener("ram_usada", function(event) {
		app_info.UUE_RAM(event.data + '%');
	}, false);

	source.addEventListener("cpu_usada", function(event) {
		app_info.UUE_CPU(event.data + '%');
	}, false);

	source.addEventListener("disco_usado", function(event) {
		app_info.UUE_DISCO(event.data + '%');
	}, false);

	source.addEventListener("internet", function(event) {
		if (event.data == 'online') {
			jQuery('#status_internet').removeClass();
			app_info.UUE_Internet('<i class="fa fa-chain"></i> ONLINE');
		} else {
			jQuery('#status_internet').addClass('has-text-danger has-text-weight-bold');
			app_info.UUE_Internet('<i class="fa fa-unlink"></i> OFFLINE');
		}
	}, false);

	source.addEventListener("acesso", function(event) {
		if (event.data == 'destroy') {
			alerta_baixo2('acesso ao sistema encerrado');
			setTimeout("window.location.href = 'login.hhvm'", 9000);
		}
	}, false);

	source.addEventListener("avisobot", function(event) {
		alerta_baixo1(event.data);
	}, false);
};;;

// NL2BR SIMILAR PHP ------------------------------------------------------------------------------
function nl2br(str, is_xhtml) {
	if (typeof str === 'undefined' || str === null) return '';
	var breakTag = (is_xhtml || typeof is_xhtml === 'undefined') ? '<br />' : '<br>';
	return (str + '').replace(/([^>\r\n]?)(\r\n|\n\r|\r|\n)/g, '$1' + breakTag + '$2');
};;;

// ENCODE UTF8 SIMILAR PHP ------------------------------------------------------------------------
function utf8_encode(argString) {
	var string = (argString + '');
	var utftext = "",
		start, end, stringl = 0;

	start = end = 0;
	stringl = string.length;
	for (var n = 0; n < stringl; n++) {
		var c1 = string.charCodeAt(n);
		var enc = null;

		if (c1 < 128) {
			end++;
		} else if (c1 > 127 && c1 < 2048) {
			enc = String.fromCharCode((c1 >> 6) | 192) + String.fromCharCode((c1 & 63) | 128);
		} else {
			enc = String.fromCharCode((c1 >> 12) | 224) + String.fromCharCode(((c1 >> 6) & 63) | 128) + String.fromCharCode((c1 & 63) | 128);
		}
		if (enc !== null) {
			if (end > start) {
				utftext += string.slice(start, end);
			}
			utftext += enc;
			start = end = n + 1;
		}
	}

	if (end > start) {
		utftext += string.slice(start, stringl);
	}

	return utftext;
};;;

// ENCODE STRING COM BASE64 -----------------------------------------------------------------------
function baze64_encode(data) {
	var b64 = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=";
	var o1, o2, o3, h1, h2, h3, h4, bits, i = 0,
		ac = 0,
		enc = "",
		tmp_arr = [];

	if (!data) {
		return data;
	}

	data = utf8_encode(data + '');

	do {
		o1 = data.charCodeAt(i++);
		o2 = data.charCodeAt(i++);
		o3 = data.charCodeAt(i++);

		bits = o1 << 16 | o2 << 8 | o3;

		h1 = bits >> 18 & 0x3f;
		h2 = bits >> 12 & 0x3f;
		h3 = bits >> 6 & 0x3f;
		h4 = bits & 0x3f;

		tmp_arr[ac++] = b64.charAt(h1) + b64.charAt(h2) + b64.charAt(h3) + b64.charAt(h4);
	} while (i < data.length);

	enc = tmp_arr.join('');

	switch (data.length % 3) {
	case 1:
		enc = enc.slice(0, -2) + '==';
		break;
	case 2:
		enc = enc.slice(0, -1) + '=';
		break;
	}

	return enc;
};;;

// FUNCOES IP / STRING ----------------------------------------------------------------------------
function ip2long(IP) {
	var i = 0;
	IP = IP.match(/^([1-9]\d*|0[0-7]*|0x[\da-f]+)(?:\.([1-9]\d*|0[0-7]*|0x[\da-f]+))?(?:\.([1-9]\d*|0[0-7]*|0x[\da-f]+))?(?:\.([1-9]\d*|0[0-7]*|0x[\da-f]+))?$/i);
	if (!IP) {
		return false;
	}
	IP[0] = 0;
	for (i = 1; i < 5; i += 1) {
		IP[0] += !! ((IP[i] || '').length);
		IP[i] = parseInt(IP[i]) || 0;
	}
	IP.push(256, 256, 256, 256);
	IP[4 + IP[0]] *= Math.pow(256, 4 - IP[0]);
	if (IP[1] >= IP[5] || IP[2] >= IP[6] || IP[3] >= IP[7] || IP[4] >= IP[8]) {
		return false;
	}
	return IP[1] * (IP[0] === 1 || 16777216) + IP[2] * (IP[0] <= 2 || 65536) + IP[3] * (IP[0] <= 3 || 256) + IP[4] * 1;
};;;

function long2ip(proper_address) {
	var output = false;

	if (!isNaN(proper_address) && (proper_address >= 0 || proper_address <= 4294967295)) {
		output = Math.floor(proper_address / Math.pow(256, 3)) + '.' + Math.floor((proper_address % Math.pow(256, 3)) / Math.pow(256, 2)) + '.' + Math.floor(((proper_address % Math.pow(256, 3)) % Math.pow(256, 2)) / Math.pow(256, 1)) + '.' + Math.floor((((proper_address % Math.pow(256, 3)) % Math.pow(256, 2)) % Math.pow(256, 1)) / Math.pow(256, 0));
	}

	return output;
};;;

// INCLUIR ITEM NO MENU ---------------------------------------------------------------------------
const criarLink = function() {
	return {
		provedor: function(json) {
			var mymenu = JSON.parse(json);
			jQuery( "<a href='" + mymenu.plink + "' class='navbar-item'><i class='" + mymenu.picone + "'></i>&nbsp; " + mymenu.ptext + " </a>" ).appendTo("#menu_provedor");
		},
		provedor2: function(json) {
			var mymenu = JSON.parse(json);
			jQuery( "<a href='" + mymenu.plink + "' class='navbar-item'><i class='" + mymenu.picone + "'></i>&nbsp; " + mymenu.ptext + " </a>" ).appendTo("#menu_provedor2");
		},
		provedor3: function(json) {
			var mymenu = JSON.parse(json);
			jQuery( "<a href='" + mymenu.plink + "' class='navbar-item'><i class='" + mymenu.picone + "'></i>&nbsp; " + mymenu.ptext + " </a>" ).appendTo("#menu_provedor3");
		},
		opcoes: function(json) {
			var mymenu = JSON.parse(json);
			jQuery( "<a href='" + mymenu.plink + "' class='navbar-item'><i class='" + mymenu.picone + "'></i>&nbsp; " + mymenu.ptext + " </a>" ).appendTo("#menu_opcoes");
		},
		clientes: function(json) {
			var mymenu = JSON.parse(json);
			jQuery( "<a href='" + mymenu.plink + "' class='navbar-item'><i class='" + mymenu.picone + "'></i>&nbsp; " + mymenu.ptext + " </a>" ).appendTo("#menu_clientes");
		},
		clientes2: function(json) {
			var mymenu = JSON.parse(json);
			jQuery( "<a href='" + mymenu.plink + "' class='navbar-item'><i class='" + mymenu.picone + "'></i>&nbsp; " + mymenu.ptext + " </a>" ).appendTo("#menu_clientes2");
		},
		clientes3: function(json) {
			var mymenu = JSON.parse(json);
			jQuery( "<a href='" + mymenu.plink + "' class='navbar-item'><i class='" + mymenu.picone + "'></i>&nbsp; " + mymenu.ptext + " </a>" ).appendTo("#menu_clientes3");
		},
		financeiro: function(json) {
			var mymenu = JSON.parse(json);
			jQuery( "<a href='" + mymenu.plink + "' class='navbar-item'><i class='" + mymenu.picone + "'></i>&nbsp; " + mymenu.ptext + " </a>" ).appendTo("#menu_financeiro");
		},
		financeiro2: function(json) {
			var mymenu = JSON.parse(json);
			jQuery( "<a href='" + mymenu.plink + "' class='navbar-item'><i class='" + mymenu.picone + "'></i>&nbsp; " + mymenu.ptext + " </a>" ).appendTo("#menu_financeiro2");
		},
		financeiro3: function(json) {
			var mymenu = JSON.parse(json);
			jQuery( "<a href='" + mymenu.plink + "' class='navbar-item'><i class='" + mymenu.picone + "'></i>&nbsp; " + mymenu.ptext + " </a>" ).appendTo("#menu_financeiro3");
		},
		financeiro4: function(json) {
			var mymenu = JSON.parse(json);
			jQuery( "<a href='" + mymenu.plink + "' class='navbar-item'><i class='" + mymenu.picone + "'></i>&nbsp; " + mymenu.ptext + " </a>" ).appendTo("#menu_financeiro4");
		},
		suporte: function(json) {
			var mymenu = JSON.parse(json);
			jQuery( "<a href='" + mymenu.plink + "' class='navbar-item'><i class='" + mymenu.picone + "'></i>&nbsp; " + mymenu.ptext + " </a>" ).appendTo("#menu_suporte");
		},
		suporte2: function(json) {
			var mymenu = JSON.parse(json);
			jQuery( "<a href='" + mymenu.plink + "' class='navbar-item'><i class='" + mymenu.picone + "'></i>&nbsp; " + mymenu.ptext + " </a>" ).appendTo("#menu_suporte2");
		},
		central: function(json) {
			var mymenu = JSON.parse(json);
			jQuery( "<a href='" + mymenu.plink + "' class='navbar-item'><i class='" + mymenu.picone + "'></i>&nbsp; " + mymenu.ptext + " </a>" ).appendTo("#menu_central");
		},
		hotsite: function(json) {
			var mymenu = JSON.parse(json);
			jQuery( "<a href='" + mymenu.plink + "' class='navbar-item'><i class='" + mymenu.picone + "'></i>&nbsp; " + mymenu.ptext + " </a>" ).appendTo("#menu_hotsite");
		},
		conexoes: function(json) {
			var mymenu = JSON.parse(json);
			jQuery( "<a href='" + mymenu.plink + "' class='navbar-item'><i class='" + mymenu.picone + "'></i>&nbsp; " + mymenu.ptext + " </a>" ).appendTo("#menu_conexoes");
		},
		menu_titulo: function(menu, titulo) {
			jQuery( "<h1 class=\"title is-7 is-mega-menu-title\"> " + titulo + " </h1>" ).appendTo("#menu_" + menu);
		}
	}
};;;

const add_menu = criarLink();

// FUNCAO MUDAR INFORMACOES -----------------------------------------------------------------------
const criarInfo = function() {
	return {
		UUE_NProvedor: function(info) {
			jQuery("#sistema-corpo2 #UUE_NProvedor").html(info);
		},
		UUE_Usuario: function(info) {
			jQuery("#sistema-corpo2 #UUE_Usuario").html(info);
		},
		UUE_SESSOES: function(info) {
			jQuery("#sistema-corpo2 #UUE_SESSOES").html(info);
		},
		UUE_Ultacesso: function(info) {
			jQuery("#sistema-corpo2 #UUE_Ultacesso").html(info);
		},
		UUE_Data: function(info) {
			jQuery("#sistema-corpo2 #UUE_Data").html(info);
		},
		UUE_RAM: function(info) {
			jQuery("#sistema-corpo2 #UUE_RAM").html(info);
		},
		UUE_CPU: function(info) {
			jQuery("#sistema-corpo2 #UUE_CPU").html(info);
		},
		UUE_DISCO: function(info) {
			jQuery("#sistema-corpo2 #UUE_DISCO").html(info);
		},
		UUE_IP: function(info) {
			jQuery("#sistema-corpo2 #UUE_IP").html(info);
		},
		UUE_Internet: function(info) {
			jQuery("#sistema-corpo2 #UUE_Internet").html(info);
		}
	}
};;;

const app_info = criarInfo();

// FUNCAO MARKOV ----------------------------------------------------------------------------------
const markovChain = function() {
	const cadeia = {};
	return {
		addTexto: function(texto) {
			texto = texto.trim();
			texto = texto.replace(/[\r\n]+/g, ' ');
			const palavras = texto.split(' ');
			for (let i = 0; i < palavras.length - 1; i++) {
				const palavra = palavras[i];
				const proxPalavra = palavras[i + 1];
				if (!cadeia[palavra]) cadeia[palavra] = [];
				cadeia[palavra].push(proxPalavra);
			}
		},
		getProximaPalavra: function(palavra) {
			const proxPalavras = cadeia[palavra];
			if (!proxPalavras) return null;
			const filtragem = proxPalavras.filter(proxima => proxima.length >= 3);
			if (filtragem.length === 0) return null;
			const randomIndex = Math.floor(Math.random() * filtragem.length);
			return filtragem[randomIndex];
		}
	}
};;;

const markov_chain = markovChain();

// FUNCAO IN_ARRAY SIMILAR PHP --------------------------------------------------------------------
const in_array = function(needle, haystack, argStrict) {
	var key = '',
		strict = !! argStrict;

	if (strict) {
		for (key in haystack) {
			if (haystack[key] === needle) {
				return true;
			}
		}
	} else {
		for (key in haystack) {
			if (haystack[key] == needle) {
				return true;
			}
		}
	}

	return false;
};;;

// FUNCAO STRIP_TAGS SIMILAR PHP ------------------------------------------------------------------
function strip_tags(entrada) {
	const parser = new DOMParser();
	const doc = parser.parseFromString(entrada, 'text/html');
	return doc.body.textContent || '';
};;;

// FUNCAO SHUFFLE SIMILAR PHP ---------------------------------------------------------------------
function shuffle(inputArr) {
	var valArr = [],
		k = '',
		i = 0,
		strictForIn = false,
		populateArr = [];

	for (k in inputArr) {
		if (inputArr.hasOwnProperty(k)) {
			valArr.push(inputArr[k]);
			if (strictForIn) {
				delete inputArr[k];
			}
		}
	}
	valArr.sort(function () {
		return 0.5 - Math.random();
	});

	this.php_js = this.php_js || {};
	this.php_js.ini = this.php_js.ini || {};
	strictForIn = this.php_js.ini['phpjs.strictForIn'] && this.php_js.ini['phpjs.strictForIn'].local_value && this.php_js.ini['phpjs.strictForIn'].local_value !== 'off';
	populateArr = strictForIn ? inputArr : populateArr;

	for (i = 0; i < valArr.length; i++) {
		populateArr[i] = valArr[i];
	}

	return strictForIn || populateArr;
};;;
