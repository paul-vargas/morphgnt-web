var localConfig = {
	version: "0.0.1",
	debug: true,
	timeout: 30000,
	book: null,
	chapter: null,
	keynameForBook: "greek_vldtn_book",
	keynameForChapter: "greek_vldtn_chapter"
};

var books = {
	"1": {"a": "Matthew", "b": "Matt.", "c": "28"},
	"2": {"a": "Mark", "b": "Mark", "c": "16"},
	"3": {"a": "Luke", "b": "Luke", "c": "24"},
	"4": {"a": "John", "b": "John", "c": "21"},
	"5": {"a": "Acts", "b": "Acts", "c": "28"},
	"6": {"a": "Romans", "b": "Rom.", "c": "16"},
	"7": {"a": "1 Corinthians", "b": "1 Cor.", "c": "16"},
	"8": {"a": "2 Corinthians", "b": "2 Cor.", "c": "13"},
	"9": {"a": "Galatians", "b": "Gal.", "c": "6"},
	"10": {"a": "Ephesians", "b": "Eph.", "c": "6"},
	"11": {"a": "Philippians", "b": "Phil.", "c": "4"},
	"12": {"a": "Colossians", "b": "Col.", "c": "4"},
	"13": {"a": "1 Thessalonians", "b": "1 Thess.", "c": "5"},
	"14": {"a": "2 Thessalonians", "b": "2 Thess.", "c": "3"},
	"15": {"a": "1 Timothy", "b": "1 Tim.", "c": "6"},
	"16": {"a": "2 Timothy", "b": "2 Tim.", "c": "4"},
	"17": {"a": "Titus", "b": "Titus", "c": "3"},
	"18": {"a": "Philemon", "b": "Philem.", "c": "1"},
	"19": {"a": "Hebrews", "b": "Heb.", "c": "13"},
	"20": {"a": "James", "b": "James", "c": "5"},
	"21": {"a": "1 Peter", "b": "1 Pet.", "c": "5"},
	"22": {"a": "2 Peter", "b": "2 Pet.", "c": "3"},
	"23": {"a": "1 John", "b": "1 John", "c": "5"},
	"24": {"a": "2 John", "b": "2 John", "c": "1"},
	"25": {"a": "3 John", "b": "3 John", "c": "1"},
	"26": {"a": "Jude", "b": "Jude", "c": "1"},
	"27": {"a": "Revelation", "b": "Rev.", "c": "22"}
};

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
}

function decrement() {
	var $div = $("#text-div");
    var fontSize = parseFloat($div.css("font-size").split("px")[0]);
    var fontInt = fontSize - 1;
    $div.css("font-size", fontInt + "px");
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

function changeChapter() {
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
		$chapter.val(min);
	}
	var chapter = $chapter.val();
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