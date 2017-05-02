<%-- 
    Document   : custom.js
    Created on : Apr 18, 2017, 10:00:18 PM
    Author     : anonymous
--%>

<%@page contentType="text/javascript" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="${language}" />
<fmt:setBundle basename="org.paulvargas.greek.resources.i18n.greek" />
var localConfig = {
	version: "0.0.1",
	debug: true,
	timeout: 30000,
	book: null,
	chapter: null,
	fontsize: null,
	keynameForBook: "greek_vldtn_book",
	keynameForChapter: "greek_vldtn_chapter",
	keynameForFontSize: "greek_vldtn_fontsize"
};

var books = {
	"1": {"a": "<fmt:message key="books.1.a" />", "b": "<fmt:message key="books.1.b" />", "c": "28"},
	"2": {"a": "<fmt:message key="books.2.a" />", "b": "<fmt:message key="books.2.b" />", "c": "16"},
	"3": {"a": "<fmt:message key="books.3.a" />", "b": "<fmt:message key="books.3.b" />", "c": "24"},
	"4": {"a": "<fmt:message key="books.4.a" />", "b": "<fmt:message key="books.4.b" />", "c": "21"},
	"5": {"a": "<fmt:message key="books.5.a" />", "b": "<fmt:message key="books.5.b" />", "c": "28"},
	"6": {"a": "<fmt:message key="books.6.a" />", "b": "<fmt:message key="books.6.b" />", "c": "16"},
	"7": {"a": "<fmt:message key="books.7.a" />", "b": "<fmt:message key="books.7.b" />", "c": "16"},
	"8": {"a": "<fmt:message key="books.8.a" />", "b": "<fmt:message key="books.8.b" />", "c": "13"},
	"9": {"a": "<fmt:message key="books.9.a" />", "b": "<fmt:message key="books.9.b" />", "c": "6"},
	"10": {"a": "<fmt:message key="books.10.a" />", "b": "<fmt:message key="books.10.b" />", "c": "6"},
	"11": {"a": "<fmt:message key="books.11.a" />", "b": "<fmt:message key="books.11.b" />", "c": "4"},
	"12": {"a": "<fmt:message key="books.12.a" />", "b": "<fmt:message key="books.12.b" />", "c": "4"},
	"13": {"a": "<fmt:message key="books.13.a" />", "b": "<fmt:message key="books.13.b" />", "c": "5"},
	"14": {"a": "<fmt:message key="books.14.a" />", "b": "<fmt:message key="books.14.b" />", "c": "3"},
	"15": {"a": "<fmt:message key="books.15.a" />", "b": "<fmt:message key="books.15.b" />", "c": "6"},
	"16": {"a": "<fmt:message key="books.16.a" />", "b": "<fmt:message key="books.16.b" />", "c": "4"},
	"17": {"a": "<fmt:message key="books.17.a" />", "b": "<fmt:message key="books.17.b" />", "c": "3"},
	"18": {"a": "<fmt:message key="books.18.a" />", "b": "<fmt:message key="books.18.b" />", "c": "1"},
	"19": {"a": "<fmt:message key="books.19.a" />", "b": "<fmt:message key="books.19.b" />", "c": "13"},
	"20": {"a": "<fmt:message key="books.20.a" />", "b": "<fmt:message key="books.20.b" />", "c": "5"},
	"21": {"a": "<fmt:message key="books.21.a" />", "b": "<fmt:message key="books.21.b" />", "c": "5"},
	"22": {"a": "<fmt:message key="books.22.a" />", "b": "<fmt:message key="books.22.b" />", "c": "3"},
	"23": {"a": "<fmt:message key="books.23.a" />", "b": "<fmt:message key="books.23.b" />", "c": "5"},
	"24": {"a": "<fmt:message key="books.24.a" />", "b": "<fmt:message key="books.24.b" />", "c": "1"},
	"25": {"a": "<fmt:message key="books.25.a" />", "b": "<fmt:message key="books.25.b" />", "c": "1"},
	"26": {"a": "<fmt:message key="books.26.a" />", "b": "<fmt:message key="books.26.b" />", "c": "1"},
	"27": {"a": "<fmt:message key="books.27.a" />", "b": "<fmt:message key="books.27.b" />", "c": "22"}
};

var morph = {
	"sp": {"name": "<fmt:message key="morph.sp.name" />", "A-": "<fmt:message key="morph.sp.adjective" />", "C-": "<fmt:message key="morph.sp.conjunction" />", "D-": "<fmt:message key="morph.sp.adverb" />", "I-": "<fmt:message key="morph.sp.interjection" />", "N-": "<fmt:message key="morph.sp.noun" />", "P-": "<fmt:message key="morph.sp.preposition" />", "RA": "<fmt:message key="morph.sp.definite.article" />", "RD": "<fmt:message key="morph.sp.demonstrative.pronoun" />", "RI": "<fmt:message key="morph.sp.interrogative.indefinite.pronoun" />", "RP": "<fmt:message key="morph.sp.personal.pronoun" />", "RR": "<fmt:message key="morph.sp.relative.pronoun" />", "V-": "<fmt:message key="morph.sp.verb" />", "X-": "<fmt:message key="morph.sp.particle" />"},
	"person": {"name": "<fmt:message key="morph.person.name" />", ".": "", "1": "<fmt:message key="morph.person.1st" />", "2": "<fmt:message key="morph.person.2nd" />", "3": "<fmt:message key="morph.person.3rd" />"},
	"tense": {"name": "<fmt:message key="morph.tense.name" />", ".": "", "P": "<fmt:message key="morph.tense.present" />", "I": "<fmt:message key="morph.tense.imperfect" />", "F": "<fmt:message key="morph.tense.future" />", "A": "<fmt:message key="morph.tense.aorist" />", "X": "<fmt:message key="morph.tense.perfect" />", "Y": "<fmt:message key="morph.tense.pluperfect" />"},
	"voice": {"name": "<fmt:message key="morph.voice.name" />", ".": "", "A": "<fmt:message key="morph.voice.active" />", "M": "<fmt:message key="morph.voice.middle" />", "P": "<fmt:message key="morph.voice.oassive" />"},
	"mood": {"name": "<fmt:message key="morph.mood.name" />", ".": "", "I": "<fmt:message key="morph.mood.indicative" />", "D": "<fmt:message key="morph.mood.imperative" />", "S": "<fmt:message key="morph.mood.subjunctive" />", "O": "<fmt:message key="morph.mood.optative" />", "N": "<fmt:message key="morph.mood.infinitive" />", "P": "<fmt:message key="morph.mood.participle" />"},
	"case": {"name": "<fmt:message key="morph.case.name" />", ".": "", "N": "<fmt:message key="morph.case.nominative" />", "G": "<fmt:message key="morph.case.genitive" />", "D": "<fmt:message key="morph.case.dative" />", "A": "<fmt:message key="morph.case.accusative" />", "V": "<fmt:message key="morph.case.vocative" />"},
	"number": {"name": "<fmt:message key="morph.number.name" />", ".": "", "S": "<fmt:message key="morph.number.singular" />", "P": "<fmt:message key="morph.number.plural" />"},
	"gender": {"name": "<fmt:message key="morph.gender.name" />", ".": "", "M": "<fmt:message key="morph.gender.masculine" />", "F": "<fmt:message key="morph.gender.feminine" />", "N": "<fmt:message key="morph.gender.neuter" />"},
	"degree": {"name": "<fmt:message key="morph.degree.name" />", ".": "", "C": "<fmt:message key="morph.degree.comparative" />", "S": "<fmt:message key="morph.degree.superlative" />"}
};

$(function () {

	// Default settings for AJAX calls
	$.ajaxSetup({
		timeout: localConfig.timeout,
		cache: false
	});

	loadDefaults();

	var $book = $("select[name=book]");
	$.each(books, function (name, obj) {
		var $option = $("<option/>").text(obj.a).val(name).data(obj);
		$book.append($option);
	});
	$book.val(localConfig.book);
	var $chapter = $("input[name=chapter]");
	var $chapters = $("#chapters");
	for (var i = 0, max = parseInt(books[localConfig.book].c); i < max; i++) {
		var $option = $("<option/>").val(i + 1);
		$chapters.append($option);
	}
	$chapter.attr("max", books[localConfig.book].c);
	$chapter.val(localConfig.chapter);

	$("#text-div").css("font-size", localConfig.fontsize);

});

$(window).load(function () {
	loadVerses(localConfig.book, localConfig.chapter);
});



/**
 * Load defaults from the local storage.
 */
function loadDefaults() {
	localConfig.book = localStorage.getItem(localConfig.keynameForBook) || "1";
	localConfig.chapter = localStorage.getItem(localConfig.keynameForChapter) || "1";
	localConfig.fontsize = localStorage.getItem(localConfig.keynameForFontSize) || "inherit";
}

function replaceChars(ele) {
	var text = $.trim($(ele).val());
	text = text.replace(/[ΆΑάαἀἁἂἃἄἅἆἇἈἉἊἋἌἍἎἏὰάᾀᾁᾂᾃᾄᾅᾆᾇᾈᾉᾊᾋᾌᾍᾎᾏᾰᾱᾲᾳᾴᾶᾷᾸᾹᾺΆᾼ]/g, "α");
	text = text.replace(/[Ββᵦ]/g, "β");
	text = text.replace(/[Γγᴦᵞᵧ]/g, "γ");
	text = text.replace(/[Δδ]/g, "δ");
	text = text.replace(/[ΈΕέεἐἑἒἓἔἕἘἙἚἛἜἝὲέῈΈ]/g, "ε");
	text = text.replace(/[Ζζ]/g, "ζ");
	text = text.replace(/[ΉΗήηἠἡἢἣἤἥἦἧἨἩἪἫἬἭἮἯὴήᾐᾑᾒᾓᾔᾕᾖᾗᾘᾙᾚᾛᾜᾝᾞᾟῂῃῄῆῇῊΉῌ]/g, "η");
	text = text.replace(/[Θθ]/g, "θ");
	text = text.replace(/[ΊΐΙΪίιϊἰἱἲἳἴἵἶἷἸἹἺἻἼἽἾἿὶίῐῑῒΐῖῗῘῙῚΊ℩]/g, "ι");
	text = text.replace(/[Κκ]/g, "κ");
	text = text.replace(/[Λλᴧ]/g, "λ");
	text = text.replace(/[Μμ]/g, "μ");
	text = text.replace(/[Νν]/g, "ν");
	text = text.replace(/[Ξξ]/g, "ξ");
	text = text.replace(/[ΌΟοόὀὁὂὃὄὅὈὉὊὋὌὍὸόῸΌ]/g, "ο");
	text = text.replace(/[Ππᴨ]/g, "π");
	text = text.replace(/[ΡρᴩᵨῤῥῬ]/g, "ρ");
	text = text.replace(/[Σς]/g, "ς");
	text = text.replace(/[σ]/g, "σ");
	text = text.replace(/[Ττ]/g, "τ");
	text = text.replace(/[ΎΥΫΰυϋύὐὑὒὓὔὕὖὗὙὛὝὟὺύῠῡῢΰῦῧῨῩῪΎ]/g, "υ");
	text = text.replace(/[Φφᵠᵩ]/g, "φ");
	text = text.replace(/[Χχᵪ]/g, "χ");
	text = text.replace(/[Ψψᴪ]/g, "ψ");
	text = text.replace(/[ΏΩωώὠὡὢὣὤὥὦὧὨὩὪὫὬὭὮὯὼώᾠᾡᾢᾣᾤᾥᾦᾧᾨᾩᾪᾫᾬᾭᾮᾯῲῳῴῶῷῺΏῼ]/g, "ω");
	text = text.replace(/[^α-ω%]/g, "");
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

function increment() {
	var $div = $("#text-div");
    var fontSize = parseFloat($div.css("font-size").split("px")[0]);
    var fontInt = fontSize + 1;
    $div.css("font-size", fontInt + "px");
	localStorage.setItem(localConfig.keynameForFontSize, fontInt + "px");
}

function decrement() {
	var $div = $("#text-div");
    var fontSize = parseFloat($div.css("font-size").split("px")[0]);
    var fontInt = fontSize - 1;
    $div.css("font-size", fontInt + "px");
	localStorage.setItem(localConfig.keynameForFontSize, fontInt + "px");
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
					$(this).css({"background-color": color, "padding": ".1em .3em", "box-shadow": "0 0 .3em Gray"});
				}
			});
		}
	});
}

function changeChapter(chapter) {
	var $book = $("select[name=book]");
	var $chapter = $("input[name=chapter]");
	var $chapters = $("#chapters");
	var book = $book.val();
	if (book !== localConfig.book) {
		$chapters.empty();
		for (var i = 0, max = parseInt(books[book].c); i < max; i++) {
			var $option = $("<option/>").val(i + 1);
			$chapters.append($option);
		}
		$chapter.attr("max", books[book].c);
		var min = $chapter.attr("min");
		$chapter.val(chapter || min);
	}
	chapter = $chapter.val();
	loadVerses(book, chapter);
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
					if (v > 0) {
						$div.append("<br/>");
					}
					v = obj.v;
					var $small = $("<small/>").append($("<strong/>").text(v));
					$div.append($small);
					$div.append(" ");
				}

				var $span = $("<span/>").data(obj)
						//.attr({"class":"tooltip0","title":obj.t2,"data-original-title":obj.t2})
						.attr({title: parseMorphology(obj), class: "greek", "data-html": true, "data-trigger": "hover focus"})
						.text(obj.t1);
				$div.append($span);
				$div.append(" ");
			});

			$div.find("span").tooltip();
			
			highlight();
			
			if (data.length > 0) {
				localConfig.book = book;
				localConfig.chapter = chapter;
				localStorage.setItem(localConfig.keynameForBook, book);
				localStorage.setItem(localConfig.keynameForChapter, chapter);		
			}

		},
		error: function (jqXHR, textStatus, errorThrown) {

		},
		complete: function (jqXHR, textStatus) {

		}
	});

}

function previous() {
	var $book = $("select[name=book]");
	var $chapter = $("input[name=chapter]");
	var book = $book.val();
	var chapter = $chapter.val();
	if (chapter === "1" && book === "1") {
		book = "27";
		chapter = "22";
	} else if (chapter === "1") {
		book = parseInt(book) - 1;
		book = book.toString();
		chapter = books[book].c;
	} else {
		chapter = parseInt(chapter) - 1;
		chapter = chapter.toString();
	}
	$book.val(book);
	$chapter.val(chapter);
	changeChapter(chapter);
}

function next() {
	var $book = $("select[name=book]");
	var $chapter = $("input[name=chapter]");
	var book = $book.val();
	var chapter = $chapter.val();
	if (chapter === books[book].c && book === "27") {
		book = "1";
		chapter = "1";
	} else if (chapter === books[book].c) {
		book = parseInt(book) + 1;
		book = book.toString();
		chapter = "1";
	} else {
		chapter = parseInt(chapter) + 1;
		chapter = chapter.toString();
	}
	$book.val(book);
	$chapter.val(chapter);
	changeChapter(chapter);
}