<%-- 
    Document   : index.jsp
    Created on : Mar 9, 2017, 7:32:03 PM
    Author     : anonymous
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>SBLGNT</title>

		<!-- Bootstrap -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<link rel="stylesheet" href="greek/assets/css/bootstrap-colorselector.css">
		<link rel="stylesheet" href="greek/assets/css/custom.css?v=1">

		<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
		<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
		<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
		  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
		<![endif]-->
	</head>
	<body>
		<div class="container-fluid">
			<h1>SBLGNT</h1>


			<form onsubmit="return false;">
				<div>
					<div class="well well-sm thepanel">
						<label>Color: <select name="color" onchange="validateState(this)"> <option></option> 
								<option value="#FF9999" style="background-color: #FF9999">Red</option>
								<option value="#FFDBBB" style="background-color: #FFDBBB">Orange</option>
								<option value="#FFFFBB" style="background-color: #FFFFBB">Yellow</option>
								<option value="#BBFFBB" style="background-color: #BBFFBB">Green</option>
								<option value="#BBFFFF" style="background-color: #BBFFFF">Cyan</option>
								<option value="#FFBBFF" style="background-color: #FFBBFF">Purple</option>
								<option value="#929292" style="background-color: #929292">Gray</option>
							</select></label>
						<label>Part of Speech: <select name="sp" onchange="validateState(this)"><option></option><option value="A-">Adjective</option><option value="C-">Conjunction</option><option value="D-">Adverb</option><option value="I-">Interjection</option><option value="N-">Noun</option><option value="P-">Preposition</option><option value="RA">Definite Article</option><option value="RD">Demonstrative Pronoun</option><option value="RI">Interrogative/Indefinite Pronoun</option><option value="RP">Personal Pronoun</option><option value="RR">Relative Pronoun</option><option value="V-">Verb</option><option value="X-">Particle</option></select></label>
						<label>Person: <select name="person" onchange="validateState(this)"><option value="."></option><option value="1">1st</option><option value="2">2nd</option><option value="3">3rd</option></select></label>
						<label>Tense: <select name="tense" onchange="validateState(this)"><option value="."></option><option value="P">Present</option><option value="I">Imperfect</option><option value="F">Future</option><option value="A">Aorist</option><option value="X">Perfect</option><option value="Y">Pluperfect</option></select></label>
						<label>Voice: <select name="voice" onchange="validateState(this)"><option value="."></option><option value="A">Active</option><option value="M">Middle</option><option value="P">Passive</option></select></label>
						<label>Mood: <select name="mood" onchange="validateState(this)"><option value="."></option><option value="I">Indicative</option><option value="D">Imperative</option><option value="S">Subjunctive</option><option value="O">Optative</option><option value="N">Infinitive</option><option value="P">Participle</option></select></label>
						<label>Case: <select name="case" onchange="validateState(this)"><option value="."></option><option value="N">Nominative</option><option value="G">Genitive</option><option value="D">Dative</option><option value="A">Accusative</option><option value="V">Vocative</option></select></label>
						<label>Number: <select name="number" onchange="validateState(this)"><option value="."></option><option value="S">Singular</option><option value="P">Plural</option></select></label>
						<label>Gender: <select name="gender" onchange="validateState(this)"><option value="."></option><option value="M">Masculine</option><option value="F">Feminine</option><option value="N">Neuter</option></select></label>
						<label>Degree: <select name="degree" onchange="validateState(this)"><option value="."></option><option value="C">Comparative</option><option value="S">Superlative</option></select></label>
						<label>Text: <input class="greek" type="text" name="t2" value="" onchange="replaceChars(this); validateState(this);"></label>
						<label>Lemma: <input class="greek" type="text" name="t4" value="" onchange="replaceChars(this); validateState(this);"></label>
						<button class="btn btn-default btn-xs" type="button" onclick="clr(this)"><span class="glyphicon glyphicon-erase" aria-hidden="true"></span> Clear</button>
						<button class="btn btn-default btn-xs" type="button" onclick="del(this)"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span> Delete</button>
						<button class="btn btn-default btn-xs" type="button" onclick="toUp(this)" aria-label="Up"><span class="glyphicon glyphicon-chevron-up" aria-hidden="true"></span></button>
						<button class="btn btn-default btn-xs" type="button" onclick="toDown(this)" aria-label="Down"><span class="glyphicon glyphicon-chevron-down" aria-hidden="true"></span></button>
					</div>
				</div><%--
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
				</p>--%>
				<div class="row form-group">
					<div class="col-xs-4 text-left">
						<button class="btn btn-primary" type="button" onclick="highlight(this)" data-loading-text="Searching..."><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> Highlight</button>
					</div>
					<div class="col-xs-8 text-right">
						<button id="modal-button" type="button" class="btn btn-default btn-xs hidden" data-toggle="modal" data-target="#modal-div"><span class="glyphicon glyphicon-modal-window" aria-hidden="true"></span> Show SQL</button>
						<button class="btn btn-success btn-xs" type="button" onclick="add()"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span> Add</button>
					</div>
				</div>
				<div>
					<label>Book: <select name="book" onchange="changeChapter()"></select></label>
					<label>Chapter: <select name="chapter" onchange="changeChapter()"></select></label>
				</div>
			</form>

			<div id="text-div"></div>
		</div>

		<!-- Scripts -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<script src="greek/assets/js/custom.js?v=1"></script>
		<script src="greek/assets/js/bootstrap-colorselector.js?v=1"></script>
	</body>
</html>