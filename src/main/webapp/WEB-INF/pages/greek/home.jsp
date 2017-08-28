<%-- 
    Document   : index.jsp
    Created on : Mar 9, 2017, 7:32:03 PM
    Author     : anonymous
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="${language}" />
<fmt:setBundle basename="org.paulvargas.greek.resources.i18n.greek" />
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>SBLGNT</title>

		<!-- Bootstrap -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
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
			
			<div id="collapse-div" class="collapse">

			<div class="form-group text-right">
				<form>

					<select id="language" name="language" onchange="submit()">
						<option value="en" ${language == 'en' ? 'selected' : ''}>English</option>
						<option value="es" ${language == 'es' ? 'selected' : ''}>Español</option>
					</select>
					<button class="btn btn-success btn-xs" type="button" onclick="add()"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span> <fmt:message key="button.add" /></button>
					<button class="btn btn-primary btn-xs" type="button" onclick="highlight(this)" data-loading-text="Searching..."><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> <fmt:message key="button.highlight" /></button>
				</form>
			</div>


			<form onsubmit="return false;">
				<div>
					<div class="well well-sm thepanel">
						<label><fmt:message key="color.name" />: <select name="color" onchange="validateState(this)"> <option></option> 
								<option value="#FF9999" style="background-color: #FF9999"><fmt:message key="color.red" /></option>
								<option value="#FFDBBB" style="background-color: #FFDBBB"><fmt:message key="color.orange" /></option>
								<option value="#FFFFBB" style="background-color: #FFFFBB"><fmt:message key="color.yellow" /></option>
								<option value="#BBFFBB" style="background-color: #BBFFBB"><fmt:message key="color.green" /></option>
								<option value="#BBFFFF" style="background-color: #BBFFFF"><fmt:message key="color.cyan" /></option>
								<option value="#FFBBFF" style="background-color: #FFBBFF"><fmt:message key="color.purple" /></option>
								<option value="#929292" style="background-color: #929292"><fmt:message key="color.gray" /></option>
							</select></label>
						<label><fmt:message key="morph.sp.name" />: <select name="sp" onchange="validateState(this)"><option></option><option value="A-"><fmt:message key="morph.sp.adjective" /></option><option value="C-"><fmt:message key="morph.sp.conjunction" /></option><option value="D-"><fmt:message key="morph.sp.adverb" /></option><option value="I-"><fmt:message key="morph.sp.interjection" /></option><option value="N-"><fmt:message key="morph.sp.noun" /></option><option value="P-"><fmt:message key="morph.sp.preposition" /></option><option value="RA"><fmt:message key="morph.sp.definite.article" /></option><option value="RD"><fmt:message key="morph.sp.demonstrative.pronoun" /></option><option value="RI"><fmt:message key="morph.sp.interrogative.indefinite.pronoun" /></option><option value="RP"><fmt:message key="morph.sp.personal.pronoun" /></option><option value="RR"><fmt:message key="morph.sp.relative.pronoun" /></option><option value="V-"><fmt:message key="morph.sp.verb" /></option><option value="X-"><fmt:message key="morph.sp.particle" /></option></select></label>
						<label><fmt:message key="morph.person.name" />: <select name="person" onchange="validateState(this)"><option value="."></option><option value="1"><fmt:message key="morph.person.1st" /></option><option value="2"><fmt:message key="morph.person.2nd" /></option><option value="3"><fmt:message key="morph.person.3rd" /></option></select></label>
						<label><fmt:message key="morph.tense.name" />: <select name="tense" onchange="validateState(this)"><option value="."></option><option value="P"><fmt:message key="morph.tense.present" /></option><option value="I"><fmt:message key="morph.tense.imperfect" /></option><option value="F"><fmt:message key="morph.tense.future" /></option><option value="A"><fmt:message key="morph.tense.aorist" /></option><option value="X"><fmt:message key="morph.tense.perfect" /></option><option value="Y"><fmt:message key="morph.tense.pluperfect" /></option></select></label>
						<label><fmt:message key="morph.voice.name" />: <select name="voice" onchange="validateState(this)"><option value="."></option><option value="A"><fmt:message key="morph.voice.active" /></option><option value="M"><fmt:message key="morph.voice.middle" /></option><option value="P"><fmt:message key="morph.voice.oassive" /></option></select></label>
						<label><fmt:message key="morph.mood.name" />: <select name="mood" onchange="validateState(this)"><option value="."></option><option value="I"><fmt:message key="morph.mood.indicative" /></option><option value="D"><fmt:message key="morph.mood.imperative" /></option><option value="S"><fmt:message key="morph.mood.subjunctive" /></option><option value="O"><fmt:message key="morph.mood.optative" /></option><option value="N"><fmt:message key="morph.mood.infinitive" /></option><option value="P"><fmt:message key="morph.mood.participle" /></option></select></label>
						<label><fmt:message key="morph.case.name" />: <select name="case" onchange="validateState(this)"><option value="."></option><option value="N"><fmt:message key="morph.case.nominative" /></option><option value="G"><fmt:message key="morph.case.genitive" /></option><option value="D"><fmt:message key="morph.case.dative" /></option><option value="A"><fmt:message key="morph.case.accusative" /></option><option value="V"><fmt:message key="morph.case.vocative" /></option></select></label>
						<label><fmt:message key="morph.number.name" />: <select name="number" onchange="validateState(this)"><option value="."></option><option value="S"><fmt:message key="morph.number.singular" /></option><option value="P"><fmt:message key="morph.number.plural" /></option></select></label>
						<label><fmt:message key="morph.gender.name" />: <select name="gender" onchange="validateState(this)"><option value="."></option><option value="M"><fmt:message key="morph.gender.masculine" /></option><option value="F"><fmt:message key="morph.gender.feminine" /></option><option value="N"><fmt:message key="morph.gender.neuter" /></option></select></label>
						<label><fmt:message key="morph.degree.name" />: <select name="degree" onchange="validateState(this)"><option value="."></option><option value="C"><fmt:message key="morph.degree.comparative" /></option><option value="S"><fmt:message key="morph.degree.superlative" /></option></select></label><%--
						<label>Text: <input class="greek" type="text" name="t2" value="" onchange="replaceChars(this); validateState(this);"></label>
						<label>Lemma: <input class="greek" type="text" name="t4" value="" onchange="replaceChars(this); validateState(this);"></label>--%>
						<button class="btn btn-default btn-xs" type="button" onclick="clr(this)"><span class="glyphicon glyphicon-erase" aria-hidden="true"></span> <fmt:message key="button.clear" /></button>
						<button class="btn btn-default btn-xs" type="button" onclick="del(this)"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span> <fmt:message key="button.delete" /></button>
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
			</form>
			</div>
			<div class="form-group text-right">
				<a href="#collapse-div" data-toggle="collapse"><fmt:message key="link.collapse" /></a>
			</div>
			<div class="row form-group">
				<div class="col-xs-8 text-left">
					<label><fmt:message key="book.name" />: <select name="book" onchange="changeChapter(event, this)"></select></label>
					<label><fmt:message key="chapter.name" />: <input type="number" name="chapter" list="chapters" min="1" max="5" step="1" autocomplete="off" inputmode="numeric" oninput="changeChapter(event, this)"><datalist id="chapters"></datalist></label>
				</div>
				<div class="col-xs-4 text-right"><%--
					<div class="btn-group" role="group">--%>
						<button class="btn btn-default btn-sm" type="button" onclick="decrement()"><span class="glyphicon glyphicon-font" aria-hidden="true"></span><span class="glyphicon glyphicon-minus" aria-hidden="true"></span></button>
						<button class="btn btn-default btn-sm" type="button" onclick="increment()"><span class="glyphicon glyphicon-font" aria-hidden="true"></span><span class="glyphicon glyphicon-plus" aria-hidden="true"></span></button><%--
					</div>--%><%--
					<div class="btn-group" role="group">--%>
						<button class="btn btn-info btn-sm" type="button" aria-label="<fmt:message key="button.clear" />" onclick="previous(event, this)"><span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span></button>
						<button class="btn btn-info btn-sm" type="button" aria-label="<fmt:message key="button.clear" />" onclick="next(event, this)"><span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span></button><%--
					</div>--%>
				</div>
			</div>

			<h4 class="text-center" id="passage"></h4>
			<hr>
			<div id="text-div"></div>

			<div class="row form-group">
				<div class="col-xs-8 text-left">
				</div>
				<div class="col-xs-4 text-right"><%--
					<div class="btn-group" role="group">--%>
						<button class="btn btn-info btn-sm" type="button" aria-label="<fmt:message key="button.clear" />" onclick="previous(event, this)"><span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span></button>
						<button class="btn btn-info btn-sm" type="button" aria-label="<fmt:message key="button.clear" />" onclick="next(event, this)"><span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span></button><%--
					</div>--%>
				</div>
			</div>

			<div id="loader-div" class="modal-wheel" style="display: none">
				<div class="wheel"></div>
			</div>

		</div>

		<!-- Scripts -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<script src="greek/assets/js/custom.js?v=1"></script>
	</body>
</html>
