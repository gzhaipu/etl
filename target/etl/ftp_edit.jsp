<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" session="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Modifier connexion</title>
<meta http-equiv="X-UA-Compatible" content="IE=8" />
<!-- Bootstrap CSS Toolkit styles -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/bootstrap-responsive.min.css">
<link rel="stylesheet" href="css/style.css">

<!--[if lt IE 7]><link rel="stylesheet" href="css/bootstrap-ie6.min.css"><![endif]-->
<!--[if lt IE 9]><script src="js/html5.js"></script><![endif]-->

<script src="js/jquery/jquery-1.7.2.min.js"></script>
<script src="js/js-bootstrap/bootstrap.min.js"></script>
</head>
<body>
	<jsp:include page="/inc/menu-header.jsp" />
	<div class="container-fluid">
		<div class="row-fluid">
			<jsp:include page="/inc/menu-left.jsp" />
			<div class="span9">
				<form:form cssClass="form-horizontal"
					commandName="FTPConnectionBean" enctype="multipart/form-data"
					method="POST">
					<fieldset>
						<div class="row span9">
							<div class="legend">Modifier connexion FTP</div>
						</div>
						<div class="span6">
							<form:errors path="*" cssClass="alert alert-error"
								cssStyle="font-weight: bold;" element="div" />
							<c:if test="${not empty msg_error}">
								<div class="alert alert-error">
									<button class="close" data-dismiss="alert">�</button>
									<strong>${msg_error}</strong>
								</div>
							</c:if>
							<c:if test="${not empty msg_succcess}">
								<div class="alert alert-success">
									<button class="close" data-dismiss="alert">�</button>
									<strong>${msg_succcess}</strong>
								</div>
							</c:if>
							<div class="control-group">
								<label class="control-label-wide">Nom de la connexion
									FTP:</label>
								<div class="controls-wide">
									<form:input path="connectionName" />
								</div>
							</div>
							<div class="control-group">
								<label class="control-label-wide">Adresse du serveur
									FTP:</label>
								<div class="controls-wide">
									<form:input path="ftpAddress" />
								</div>
							</div>
							<div class="control-group">
								<label class="control-label-wide">Nom d'utilisateur :</label>
								<div class="controls-wide">
									<form:input path="username" />
								</div>
							</div>
							<div class="control-group">
								<label class="control-label-wide">Mot de passe :</label>
								<div class="controls-wide">
									<form:input path="password" />
								</div>
							</div>
							<div class="control-group">
								<label class="control-label-wide">Port :</label>
								<div class="controls-wide">
									<form:input path="port" />
								</div>
							</div>
					</fieldset>
					<div class="form-actions">
						<input class="btn" type="submit" name="action"
							value="Tester la connexion" /> <input class="btn btn-primary"
							type="submit" name="action" value="Sauvegarder" />
					</div>
				</form:form>
			</div>
		</div>
	</div>
	</div>
</body>
</html>