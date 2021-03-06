<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8" session="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Modifier structure de données</title>
<meta http-equiv="X-UA-Compatible" content="IE=8" />

<!-- Bootstrap CSS Toolkit styles -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/bootstrap-responsive.min.css">
<link rel="stylesheet" href="css/style.css">
<link type="text/css" href="css/jquery/themes/base/ui.all.css"
	rel="stylesheet" />

<!--[if lt IE 7]><link rel="stylesheet" href="css/bootstrap-ie6.min.css"><![endif]-->
<!--[if lt IE 9]><script src="js/html5.js"></script><![endif]-->

<script src="js/jquery/jquery-1.7.2.min.js"></script>
<script src="js/jquery/jquery-ui.min.js"></script>
<script src="js/js-bootstrap/bootstrap.min.js"></script>

<script type="text/javascript" src="js/jquery/ui/ui.core.min.js"></script>
<script type="text/javascript" src="js/jquery/ui/ui.draggable.min.js"></script>
<script type="text/javascript" src="js/jquery/ui/ui.resizable.min.js"></script>
<script type="text/javascript" src="js/jquery/ui/ui.dialog.min.js"></script>

<script>
	$(function() {
		$("#dialog:ui-dialog").dialog("destroy");
		$("#dialog-confirm").hide();
		$(".remove-link").click(function(e) {
			e.preventDefault();
			var targetUrl = $(this).attr("href");
			$("#dialog-confirm").dialog({
				autoOpen : false,
				bgiframe : true,
				resizable : false,
				draggable : false,
				height : 156,
				width : 440,
				modal : true,
				overlay : {
					backgroundColor : '#000',
					opacity : 0.5
				},
				buttons : {
					'Annuler' : function() {
						$(this).dialog("close");
					},
					'Supprimer' : function() {
						window.location.href = targetUrl;
					}
				}
			});

			$("#dialog-confirm").dialog("open");
		});
	});
</script>
</head>
<body>
	<div id="dialog-confirm" title="Confirmer la suppression">
		<p>
			<span class="ui-icon ui-icon-alert"
				style="float: left; margin: 0 7px 20px 0;"></span>Cet élément sera
			définitivement supprimé et ne peut pas être récupéré. Etes-vous sûr?
		</p>
	</div>
	<jsp:include page="/inc/menu-header.jsp" />
	<div class="container-fluid">
		<div class="row-fluid">
			<jsp:include page="/inc/menu-left.jsp" />
			<div class="span9">
				<form:form id="form-local" commandName="DataStructureBean"
					cssClass="form-horizontal" enctype="multipart/form-data"
					method="POST" action="data_structure_edit">
					<fieldset>
						<div class="legend">Modifier une structure de données</div>
						<form:errors path="*" cssClass="alert alert-error"
							cssStyle="font-weight: bold;" element="div" />
						<c:if test="${not empty msg_error}">
							<div class="alert alert-error">
								<button class="close" data-dismiss="alert">×</button>
								<span class="label label-important" style="margin-right: 20px;">Erreur</span><strong>${msg_error}</strong>
							</div>
						</c:if>
						<c:if test="${not empty msg_succcess}">
							<div class="alert alert-success">
								<button class="close" data-dismiss="alert">×</button>
								<span class="label label-success" style="margin-right: 20px;">Succès</span><strong>${msg_succcess}</strong>
							</div>
						</c:if>
						<div class="row" style="margin-left: 0;">
							<div class="span8">
								<div class="control-group">
									<label class="control-label-wide" style="width: 220px; font-weight: bold;">Nom
										de la structure de données :</label>
									<div class="controls-wide" style="margin-left: 230px;">
										<form:input class="span5" path="name" />
									</div>
								</div>
							</div>
						</div>
						<div class="row" style="margin-left: 10px;">
							<div class="span2">
								<a class="btn btn-mini btn-success" href="column_add">
									<i class="icon-plus-sign icon-white"></i> Ajouter une colonne
								</a>
							</div>
						</div>
						<div class="span11" style="width: 1100px; margin-left: 5px;">
							<table class="table table-bordered table-striped">
								<thead style="font-size: 12px;">
									<tr>
										<th>#</th>
										<th>Nom</th>
										<th>Type</th>
										<th>Longueur</th>
										<th>Valeur par défaut</th>
										<th>Valeur min</th>
										<th>Valeur max</th>
										<th style="width: 60px;">Nullable</th>
										<th style="width: 80px;">Clé primaire</th>
										<th></th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="column" items="${ColumnsList}">
										<tr>
											<td>${column.order}</td>
											<td>${column.name}</td>
											<td>${column.display_type}</td>
											<td>${column.lenght}</td>
											<td>${column.default_value}</td>
											<td>${column.min_value}</td>
											<td>${column.max_value}</td>
											<td style="text-align: center;"><c:choose>
													<c:when test='${column.nullable == true}'>
														<i class="icon-ok"></i>
													</c:when>
													<c:otherwise>
														<i class="icon-remove"></i>
													</c:otherwise>
												</c:choose></td>
											<td style="text-align: center;"><c:choose>
													<c:when test='${column.primary_Key == true}'>
														<i class="icon-ok"></i>
													</c:when>
													<c:otherwise>
														<i class="icon-remove"></i>
													</c:otherwise>
												</c:choose></td>
											<td style="width: 90px;"><a class="btn btn-mini"
												href="${column.edit_url}"> <i class="icon-edit"></i>
													Modifier
											</a></td>
											<td style="width: 90px;"><a
												class="btn btn-mini btn-danger remove-link"
												href="${column.delete_url}"> <i
													class="icon-trash icon-white"></i> Supprimer
											</a></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</fieldset>
					<div class="form-actions">
						<input class="btn" type="reset" name="reset" value="Annuler" /> <input
							class="btn btn-primary" type="submit" name="action"
							value="Sauvegarder" />
					</div>
				</form:form>
			</div>
		</div>
	</div>
	</div>
</body>
</html>