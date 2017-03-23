$(function () {

});

$(window).load(function () {
	loadVerses(4, 1);
});

var morph = {
	"sp": {"name": "Part of Speech", "A-": "Adjective", "C-": "Conjunction", "D-": "Adverb", "I-": "Interjection", "N-": "Noun", "P-": "Preposition", "RA": "Definite Article", "RD": "Demonstrative Pronoun", "RI": "Interrogative/Indefinite Pronoun", "RP": "Personal Pronoun", "RR": "Relative Pronoun", "V-": "Verb", "X-": "Particle"},
	"person": {"name": "Person", ".": "", "1": "1st", "2": "2nd", "3": "3rd"},
	"tense": {"name": "Tense", ".": "", "P": "Present", "I": "Imperfect", "F": "Future", "A": "Aorist", "X": "Perfect", "Y": "Pluperfect"},
	"voice": {"name": "Voice", ".": "", "A": "Active", "M": "Middle", "P": "Passive"},
	"mood": {"name": "Mood", ".": "", "I": "Indicative", "D": "Imperative", "S": "Subjunctive", "O": "Optative", "N": "Infinitive", "P": "Participle"},
	"case": {"name": "Case", ".": "", "N": "Nominative", "G": "Genitive", "D": "Dative", "A": "Accusative", "V": "Vocative"},
	"number": {"name": "Number", ".": "", "S": "Singular", "P": "Plural"},
	"gender": {"name": "Gender", ".": "", "M": "Masculine", "F": "Feminine", "N": "Neuter"},
	"degree": {"name": "Degree", ".": "", "C": "Comparative", "S": "Superlative"}
};

function replaceChars(ele) {
	var text = $.trim($(ele).val());
	text = text.replace(/[\u0386\u0391\u1f08\u1f09\u1f0a\u1f0b\u1f0c\u1f0d\u1f0e\u1f0f\u1f88\u1f89\u1f8a\u1f8b\u1f8c\u1f8d\u1f8e\u1f8f\u1fb8\u1fb9\u1fba\u1fbb\u1fbc\u03ac\u03b1\u1f00\u1f01\u1f02\u1f03\u1f04\u1f05\u1f06\u1f07\u1f70\u1f71\u1f80\u1f81\u1f82\u1f83\u1f84\u1f85\u1f86\u1f87\u1fb0\u1fb1\u1fb2\u1fb3\u1fb4\u1fb6\u1fb7]/, "α");
	text = text.replace(/[\u0392\u03b2]/, "β");
	text = text.replace(/[\u0393\u03b3]/, "γ");
	text = text.replace(/[\u0394\u03b4]/, "δ");
	text = text.replace(/[\u0388\u0395\u1f18\u1f19\u1f1a\u1f1b\u1f1c\u1f1d\u1fc8\u1fc9\u03ad\u03b5\u1f10\u1f11\u1f12\u1f13\u1f14\u1f15\u1f72\u1f73]/, "ε");
	text = text.replace(/[\u0396\u03b6]/, "ζ");
	text = text.replace(/[\u0389\u0397\u1f28\u1f29\u1f2a\u1f2b\u1f2c\u1f2d\u1f2e\u1f2f\u1f98\u1f99\u1f9a\u1f9b\u1f9c\u1f9d\u1f9e\u1f9f\u1fca\u1fcb\u1fcc\u03ae\u03b7\u1f20\u1f21\u1f22\u1f23\u1f24\u1f25\u1f26\u1f27\u1f74\u1f75\u1f90\u1f91\u1f92\u1f93\u1f94\u1f95\u1f96\u1f97\u1fc2\u1fc3\u1fc4\u1fc6\u1fc7]/, "η");
	text = text.replace(/[\u0398\u03b8]/, "θ");
	text = text.replace(/[\u038a\u0399\u03aa\u1f38\u1f39\u1f3a\u1f3b\u1f3c\u1f3d\u1f3e\u1f3f\u1fd8\u1fd9\u1fda\u1fdb\u0390\u03af\u03b9\u03ca\u1f30\u1f31\u1f32\u1f33\u1f34\u1f35\u1f36\u1f37\u1f76\u1f77\u1fd0\u1fd1\u1fd2\u1fd3\u1fd6\u1fd7]/, "ι");
	text = text.replace(/[\u039a\u03ba]/, "κ");
	text = text.replace(/[\u039b\u03bb]/, "λ");
	text = text.replace(/[\u039c\u03bc]/, "μ");
	text = text.replace(/[\u039d\u03bd]/, "ν");
	text = text.replace(/[\u039e\u03be]/, "ξ");
	text = text.replace(/[\u038c\u039f\u1f48\u1f49\u1f4a\u1f4b\u1f4c\u1f4d\u1ff8\u1ff9\u03bf\u03cc\u1f40\u1f41\u1f42\u1f43\u1f44\u1f45\u1f78\u1f79]/, "ο");
	text = text.replace(/[\u03a0\u03c0]/, "π");
	text = text.replace(/[\u03a1\u1fec\u03c1\u1fe4\u1fe5]/, "ρ");
	text = text.replace(/[\u03c2]/, "ς");
	text = text.replace(/[\u03a3\u03c3]/, "σ");
	text = text.replace(/[\u03a4\u03c4]/, "τ");
	text = text.replace(/[\u038e\u03a5\u03ab\u1f59\u1f5b\u1f5d\u1f5f\u1fe8\u1fe9\u1fea\u1feb\u03b0\u03c5\u03cb\u03cd\u1f50\u1f51\u1f52\u1f53\u1f54\u1f55\u1f56\u1f57\u1f7a\u1f7b\u1fe0\u1fe1\u1fe2\u1fe3\u1fe6\u1fe7]/, "υ");
	text = text.replace(/[\u03a6\u03c6]/, "φ");
	text = text.replace(/[\u03a7\u03c7]/, "χ");
	text = text.replace(/[\u03a8\u03c8]/, "ψ");
	text = text.replace(/[\u038f\u03a9\u1f68\u1f69\u1f6a\u1f6b\u1f6c\u1f6d\u1f6e\u1f6f\u1fa8\u1fa9\u1faa\u1fab\u1fac\u1fad\u1fae\u1faf\u1ffa\u1ffb\u1ffc\u03c9\u03ce\u1f60\u1f61\u1f62\u1f63\u1f64\u1f65\u1f66\u1f67\u1f7c\u1f7d\u1fa0\u1fa1\u1fa2\u1fa3\u1fa4\u1fa5\u1fa6\u1fa7\u1ff2\u1ff3\u1ff4\u1ff6\u1ff7]/, "ω");
	$(ele).val(text);
}

function parseMorphology(obj) {
	var t2 = obj.t2;
	var t4 = obj.t4; 
	var spcd = obj.spcd;
	var sp = spcd.substr(0, 2);
	var cd = spcd.substr(2, 8);
	var content = "<p class=\"greek\">" + t2 + ": " + morph.sp[sp];
	if (cd.charAt(1) !== "-") {
		content += ", " + morph.tense[cd.charAt(1)];
	}
	if (cd.charAt(2) !== "-") {
		content += ", " + morph.voice[cd.charAt(2)];
	}
	if (cd.charAt(3) !== "-") {
		content += ", " + morph.mood[cd.charAt(3)];
	}
	if (cd.charAt(4) !== "-") {
		content += ", " + morph.case[cd.charAt(4)];
	}
	if (cd.charAt(0) !== "-") {
		content += ", " + morph.person[cd.charAt(0)];
	}
	if (cd.charAt(5) !== "-") {
		content += ", " + morph.number[cd.charAt(5)];
	}
	if (cd.charAt(6) !== "-") {
		content += ", " + morph.gender[cd.charAt(6)];
	}
	if (cd.charAt(7) !== "-") {
		content += ", " + morph.degree[cd.charAt(7)];
	}
	content += " (" + t4 + ")</p>";
	return content;
}


function loadVerses(book, chapter) {
	$.ajax({
		url: "greek/verses/" + book + "/" + chapter,
		dataType: "json",
		beforeSend: function (xhr) {

		},
		success: function (data, textStatus, jqXHR) {
			var $div = $("#text-div").empty();
			var v = 0;
			$.each(data, function (index, obj) {
				if (v !== obj.v) {
					v = obj.v;
					var $small = $("<small/>").append($("<strong/>").text(v));
					$div.append($small);
					$div.append(" ");
				}

				var $span = $("<span/>").data(obj)
						//.attr({"class":"tooltip0","title":obj.t2,"data-original-title":obj.t2})
						.attr({title: parseMorphology(obj), class: "greek", "data-html": true})
						.text(obj.t1);
				$div.append($span);
				$div.append(" ");
			});

			$div.find("span").tooltip();


		},
		error: function (jqXHR, textStatus, errorThrown) {

		},
		complete: function (jqXHR, textStatus) {

		}
	});

}

function add() {
	var $panel = $(".thepanel").last().clone();
	$panel.find("input").val("").removeAttr("style");
	$panel.find("select").removeAttr("style");
	$panel.find("select").not("[name=sp],[name=col]").val(".");
	$panel.find("select").filter("[name=sp],[name=color]").val("");
	$(".thepanel").last().after($panel);
}

function del(arg) {
	$(arg).parents(".thepanel").remove();
	if (!$(".thepanel").length) {
		window.location.reload(false);
	}
}

function clr(arg) {
	var $panel = $(arg).parents(".thepanel");
	$panel.find("input").val("").removeAttr("style");
	$panel.find("select").removeAttr("style");
	$panel.find("select").not("[name=sp],[name=col]").val(".");
	$panel.find("select").filter("[name=sp],[name=color]").val("");
}

function toUp(arg) {
	var element = $(arg).parents(".thepanel")[0];
	var $element = $(element);
	if (element.previousElementSibling) {
		var y1 = $(element.previousElementSibling).offset().top;
		var y2 = y1 + $element.height();
		var visibleAreaStart = $(window).scrollTop();
		var visibleAreaEnd = visibleAreaStart + window.innerHeight;
		element.parentNode.insertBefore(element, element.previousElementSibling);
		if (y1 < visibleAreaStart || y2 > visibleAreaEnd) {
			$("html,body").animate({
				scrollTop: y1 - 5
			}, "slow", function () {
				$element.fadeIn(100).fadeOut(100).fadeIn(100).fadeOut(100).fadeIn(100);
			});
		} else {
			$element.fadeIn(100).fadeOut(100).fadeIn(100).fadeOut(100).fadeIn(100);
		}
	} else {
		$element.fadeIn(100).fadeOut(100).fadeIn(100).fadeOut(100).fadeIn(100);
	}
}

function toDown(arg) {
	var element = $(arg).parents(".thepanel")[0];
	var $element = $(element);
	if (element.nextElementSibling) {
		var y1 = $(element.nextElementSibling).offset().top;
		var y2 = y1 + $element.height();
		var visibleAreaStart = $(window).scrollTop();
		var visibleAreaEnd = visibleAreaStart + window.innerHeight;
		element.parentNode.insertBefore(element.nextElementSibling, element);
		if (y1 < visibleAreaStart || y2 > visibleAreaEnd) {
			$("html,body").animate({
				scrollTop: y1 - 5
			}, "slow", function () {
				$element.fadeIn(100).fadeOut(100).fadeIn(100).fadeOut(100).fadeIn(100);
			});
		} else {
			$element.fadeIn(100).fadeOut(100).fadeIn(100).fadeOut(100).fadeIn(100);
		}
	} else {
		$element.fadeIn(100).fadeOut(100).fadeIn(100).fadeOut(100).fadeIn(100);
	}
}

function validateState(ele) {
	if (ele) {
		var tagName = ele.tagName;
		var name = ele.name;
		var str;
		switch (tagName) {
			case "SELECT":
				str = ele.options[ele.selectedIndex].value;
				if (str === "" || str === ".") {
					$(ele).removeAttr("style");
				} else {
					$(ele).css("border", "1px solid Blue");
					if (name === "color") {
						$(ele).css("background-color", str);
					}
				}
				break;
			case "INPUT":
				str = ele.value;
				if (str === "") {
					$(ele).removeAttr("style");
				} else {
					$(ele).css("border", "1px solid Blue");
				}
				break;
		}
	}
}

function highlight() {

	var array = [];
	$(".thepanel").each(function (index) {
		var regex = "";
		var sp = $("select[name=sp]", this).val();
		regex += sp === "" ? ".." : sp;
		regex += $("select[name=person]", this).val();
		regex += $("select[name=tense]", this).val();
		regex += $("select[name=voice]", this).val();
		regex += $("select[name=mood]", this).val();
		regex += $("select[name=case]", this).val();
		regex += $("select[name=number]", this).val();
		regex += $("select[name=gender]", this).val();
		regex += $("select[name=degree]", this).val();
		var color = $("select[name=color]", this).val();
		array[index] = {regex: regex, color: color};
	});

	var $spans = $("#text-div").find("span.greek");
	$spans.each(function () {
		$(this).removeAttr("style");
	});

	$.each(array, function (index, obj) {
		if (obj.color !== "" && obj.regex !== "..........") {
			var regex = new RegExp(obj.regex);
			var color = obj.color;
			$spans.each(function () {
				var spcd = $(this).data("spcd");
				if (regex.test(spcd)) {
					$(this).css({"background-color": color, "padding": ".1em", "box-shadow": "0 0 .3em Gray"});
				}
			});
		}
	});




}

