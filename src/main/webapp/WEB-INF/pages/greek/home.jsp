<%-- 
    Document   : index.jsp
    Created on : Mar 9, 2017, 7:32:03 PM
    Author     : anonymous
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0"/>
		<title>JSP Page</title>
		<link rel="stylesheet" href="http://fonts.googleapis.com/icon?family=Material+Icons" >
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.0/css/materialize.min.css">
		<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
	</head>

	<body>

		<div class="container">

			<h3 class="text-center">morphological tagging <small>of the SBL Greek New Testament</small></h3>

			<div class="row">
				<form class="col s12">
					<div class="row">
						<div class="input-field col s12 m6 l6">
							<select name="sp" class="validate"><option></option><option value="A-">Adjective</option><option value="C-">Conjunction</option><option value="D-">Adverb</option><option value="I-">Interjection</option><option value="N-">Noun</option><option value="P-">Preposition</option><option value="RA">Definite Article</option><option value="RD">Demonstrative Pronoun</option><option value="RI">Interrogative/Indefinite Pronoun</option><option value="RP">Personal Pronoun</option><option value="RR">Relative Pronoun</option><option value="V-">Verb</option><option value="X-">Particle</option></select>
							<label>Part of Speech: </label>
						</div>
						<div class="input-field col s12 m6 l3">
							<select name="person" class="validate"><option value="."></option><option value="1">1st</option><option value="2">2nd</option><option value="3">3rd</option></select>
							<label>Person: </label>
						</div>
						<div class="input-field col s12 m6 l3">
							<select name="tense" onchange="validateState(this)"><option value="."></option><option value="P">Present</option><option value="I">Imperfect</option><option value="F">Future</option><option value="A">Aorist</option><option value="X">Perfect</option><option value="Y">Pluperfect</option></select>
							<label>Tense: </label>
						</div>
						<div class="input-field col s12 m6 l3">
							<select name="voice" onchange="validateState(this)"><option value="."></option><option value="A">Active</option><option value="M">Middle</option><option value="P">Passive</option></select>
							<label>Voice: </label>
						</div>
						<div class="input-field col s12 m6 l3">
							<select name="mood" onchange="validateState(this)"><option value="."></option><option value="I">Indicative</option><option value="D">Imperative</option><option value="S">Subjunctive</option><option value="O">Optative</option><option value="N">Infinitive</option><option value="P">Participle</option></select>
							<label>Mood: </label>
						</div>
						<div class="input-field col s12 m6 l3">
							<select name="case" onchange="validateState(this)"><option value="."></option><option value="N">Nominative</option><option value="G">Genitive</option><option value="D">Dative</option><option value="A">Accusative</option><option value="V">Vocative</option></select>
							<label>Case: </label>
						</div>
						<div class="input-field col s12 m6 l3">
							<select name="number" onchange="validateState(this)"><option value="."></option><option value="S">Singular</option><option value="P">Plural</option></select>
							<label>Number: </label>
						</div>
						<div class="input-field col s12 m6 l3">
							<select name="gender" onchange="validateState(this)"><option value="."></option><option value="M">Masculine</option><option value="F">Feminine</option><option value="N">Neuter</option></select>
							<label>Gender: </label>
						</div>
						<div class="input-field col s12 m6 l3">
							<select name="degree" onchange="validateState(this)"><option value="."></option><option value="C">Comparative</option><option value="S">Superlative</option></select>
							<label>Degree: </label>
						</div>
						<div class="input-field col s12 m6 l3">
							<input class="greek" type="text" name="t2" value="" onchange="replaceChars(this); validateState(this);">
							<label>Text: </label>
						</div>
						<div class="input-field col s12 m6 l3">
							<input class="greek" type="text" name="t4" value="" onchange="replaceChars(this); validateState(this);">
							<label>Lemma: </label>
						</div>
					</div>

				</form>
			</div>

			<form onsubmit="return false;">
				<div>
					<div class="input-field col s12">
					
					
					
					
					
					
					
					
					
					
					
					
					
					<button class="btn btn-default btn-xs" type="button" onclick="clr(this)"><span class="glyphicon glyphicon-erase" aria-hidden="true"></span> Clear</button>
					<button class="btn btn-default btn-xs" type="button" onclick="del(this)"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span> Delete</button>
					<button class="btn btn-default btn-xs" type="button" onclick="toUp(this)" aria-label="Up"><span class="glyphicon glyphicon-chevron-up" aria-hidden="true"></span></button>
					<button class="btn btn-default btn-xs" type="button" onclick="toDown(this)" aria-label="Down"><span class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span></button>
				</div>
				<p class="text-center hidden-xs">
					<button type="button" class="btn btn-default btn-xs greek" onclick="insertAtCursor('α')" title="ALPHA">α</button>
					<button type="button" class="btn btn-default btn-xs greek" onclick="insertAtCursor('β')" title="BETA">β</button>
					<button type="button" class="btn btn-default btn-xs greek" onclick="insertAtCursor('γ')" title="GAMMA">γ</button>
					<button type="button" class="btn btn-default btn-xs greek" onclick="insertAtCursor('δ')" title="DELTA">δ</button>
					<button type="button" class="btn btn-default btn-xs greek" onclick="insertAtCursor('ε')" title="EPSILON">ε</button>
					<button type="button" class="btn btn-default btn-xs greek" onclick="insertAtCursor('ζ')" title="ZETA">ζ</button>
					<button type="button" class="btn btn-default btn-xs greek" onclick="insertAtCursor('η')" title="ETA">η</button>
					<button type="button" class="btn btn-default btn-xs greek" onclick="insertAtCursor('θ')" title="THETA">θ</button>
					<button type="button" class="btn btn-default btn-xs greek" onclick="insertAtCursor('ι')" title="IOTA">ι</button>
					<button type="button" class="btn btn-default btn-xs greek" onclick="insertAtCursor('κ')" title="KAPPA">κ</button>
					<button type="button" class="btn btn-default btn-xs greek" onclick="insertAtCursor('λ')" title="LAMDA">λ</button>
					<button type="button" class="btn btn-default btn-xs greek" onclick="insertAtCursor('μ')" title="MU">μ</button>
					<button type="button" class="btn btn-default btn-xs greek" onclick="insertAtCursor('ν')" title="NU">ν</button>
					<button type="button" class="btn btn-default btn-xs greek" onclick="insertAtCursor('ξ')" title="XI">ξ</button>
					<button type="button" class="btn btn-default btn-xs greek" onclick="insertAtCursor('ο')" title="OMICRON">ο</button>
					<button type="button" class="btn btn-default btn-xs greek" onclick="insertAtCursor('π')" title="PI">π</button>
					<button type="button" class="btn btn-default btn-xs greek" onclick="insertAtCursor('ρ')" title="RHO">ρ</button>
					<button type="button" class="btn btn-default btn-xs greek" onclick="insertAtCursor('σ')" title="SIGMA">σ</button>
					<button type="button" class="btn btn-default btn-xs greek" onclick="insertAtCursor('τ')" title="TAU">τ</button>
					<button type="button" class="btn btn-default btn-xs greek" onclick="insertAtCursor('υ')" title="UPSILON">υ</button>
					<button type="button" class="btn btn-default btn-xs greek" onclick="insertAtCursor('φ')" title="PHI">φ</button>
					<button type="button" class="btn btn-default btn-xs greek" onclick="insertAtCursor('χ')" title="CHI">χ</button>
					<button type="button" class="btn btn-default btn-xs greek" onclick="insertAtCursor('ψ')" title="PSI">ψ</button>
					<button type="button" class="btn btn-default btn-xs greek" onclick="insertAtCursor('ω')" title="OMEGA">ω</button>
					<button type="button" class="btn btn-default btn-xs greek" onclick="insertAtCursor('%')" title="PERCENT SIGN">%</button>
				</p>
				<div class="row form-group">
					<div class="col-xs-4 text-left">
						<button class="btn btn-primary" type="button" onclick="search(this)" data-loading-text="Searching..."><span class="glyphicon glyphicon-search" aria-hidden="true"></span> Search</button>
					</div>
					<div class="col-xs-8 text-right">
						<button id="modal-button" type="button" class="btn btn-default btn-xs hidden" data-toggle="modal" data-target="#modal-div"><span class="glyphicon glyphicon-modal-window" aria-hidden="true"></span> Show SQL</button>
						<button class="btn btn-success btn-xs" type="button" onclick="add()"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span> Add</button>
					</div>
				</div>
			</form>
			<div id="results-div" class="table-responsive hidden">
				<table id="results-table" class="table table-bordered table-striped table-hover table-condensed">
					<caption>
					</caption>
					<tbody>
					</tbody>
				</table>
			</div>
			<div class="modal fade" id="modal-div" tabindex="-1" role="dialog" aria-labelledby="modal-span">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
							<span class="modal-title" id="modal-span">SQL</span>
						</div>
						<div class="modal-body">
							<div class="form-group">
								<textarea class="form-control" rows="5" onfocus="this.select()" spellcheck="false" readonly></textarea>
							</div>
						</div>
					</div>
				</div>
			</div>
			<p><img src="https://api.biblia.com/v1/PoweredByBiblia.png" alt="Powered by Biblia">
				This site uses the <a href="https://biblia.com/">Biblia</a> web services from <a href="https://www.logos.com/">Logos Bible Software</a>.</p>

		</div>
		<div id="templates-div" class="hidden">
			<div id="morpho-div" class="well well-sm">

			</div>
			<p id="letters-p" class="text-center hidden-xs">

			</p>
		</div>

		<!-- Scripts -->
		<script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
		<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.98.0/js/materialize.min.js"></script>
		<script type="text/javascript">
									$(document).ready(function () {
										$('select').material_select();
									});

									function validateState(ele) {
										if (ele) {
											var tagName = ele.tagName;
											switch (tagName) {
												case "SELECT":
													var str = ele.options[ele.selectedIndex].value;
													if (str === "" || str === ".") {
														$(ele).removeAttr("style");
													} else {
														$(ele).css("border", "1px solid Blue");
													}
													break;
												case "INPUT":
													var str = ele.value;
													if (str === "") {
														$(ele).removeAttr("style");
													} else {
														$(ele).css("border", "1px solid Blue");
													}
													break;
											}
										}
									}

		</script>
	</body>
