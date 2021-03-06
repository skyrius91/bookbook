<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table { text-align: center;}
</style>
		<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport" />
		<meta content="" name="description" />
		<meta content="" name="author" />
		<!-- ================== BEGIN BASE CSS STYLE ================== -->

	
	<!-- 생년월일,입사날짜 datepicker -->
	<link href="${pageContext.request.contextPath}/resources/assets/plugins/bootstrap-datepicker/css/datepicker.css" rel="stylesheet" />
	<link href="${pageContext.request.contextPath}/resources/assets/plugins/bootstrap-datepicker/css/datepicker3.css" rel="stylesheet" />
	<!-- 이메일 -->
	<link href="${pageContext.request.contextPath}/resources/assets/plugins/parsley/src/parsley.css" rel="stylesheet" />
	<!-- 파일 업로드 -->
	<link href="${pageContext.request.contextPath}/resources/assets/plugins/jquery-file-upload/blueimp-gallery/blueimp-gallery.min.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/resources/assets/plugins/jquery-file-upload/css/jquery.fileupload.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/resources/assets/plugins/jquery-file-upload/css/jquery.fileupload-ui.css" rel="stylesheet" />
	<!-- 주문조회 테이블 -->
	<link href="${pageContext.request.contextPath}/resources/assets/plugins/DataTables/media/css/dataTables.bootstrap.min.css" rel="stylesheet" />
	<link href="${pageContext.request.contextPath}/resources/assets/plugins/DataTables/extensions/Select/css/select.bootstrap.min.css" rel="stylesheet" />
	<link href="${pageContext.request.contextPath}/resources/assets/plugins/DataTables/extensions/Responsive/css/responsive.bootstrap.min.css" rel="stylesheet" />
	<!-- ================== END BASE CSS STYLE ================== -->
	
	<!-- ================== BEGIN BASE JS ================== -->
	<script src="${pageContext.request.contextPath}/resources/assets/plugins/pace/pace.min.js"></script>
	<!-- ================== END BASE JS ================== -->
</head>
<body>
	<div id="content" class="content">
			<!-- begin breadcrumb -->
			<ol class="breadcrumb pull-right">
				<li><a href="javascript:;">주문관리</a></li>
				<li class="active">주문조회</li>
			</ol>
			<!-- end breadcrumb -->
			<!-- begin page-header -->
			<h1 class="page-header">주문관리 <small>주문조회</small></h1>
			<!-- end page-header -->
			<br>		
		<div class="row">
		   <div class="col-md-12">
                  <div class="panel panel-inverse">
                      <div class="panel-heading">
                          <div class="panel-heading-btn">
                              <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-default" data-click="panel-expand"><i class="fa fa-expand"></i></a>
                              <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-success" data-click="panel-reload"><i class="fa fa-repeat"></i></a>
                              <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-warning" data-click="panel-collapse"><i class="fa fa-minus"></i></a>
                              <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-danger" data-click="panel-remove"><i class="fa fa-times"></i></a>
                          </div>
                          <h4 class="panel-title">주문 조회</h4>
                       </div>
					<br>
                    <br>
					<div class="panel-body">
					<form class="form-horizontal"> 
					 	<div class="row">
                      		<div class="col-md-1"></div>
                            <div class="col-md-5">
                            	<div class="form-group">
									<label class="control-label col-md-4 col-sm-4">회원 ID</label>
									<div class="col-md-6 col-sm-6">
                                       <input type="text" class="form-control" placeholder="회원 ID" name="oid" id="s_oid" />
									</div>
								</div>									
                            <div class="form-group">
                                <label class="control-label col-md-4 col-sm-4">주문 상태 :</label>
                                <div class="col-md-6 col-sm-6">
                                    <select class="form-control" name="ostate" id="s_ostate">
                                        <option value="0">-</option>
                                        <option value="1">주문완료</option>
                                        <option value="2">배송중</option>
                                        <option value="3">배송완료</option>
                                    </select>
                                </div>
                            </div>                             
                            </div>
                            <div class="col-md-5">
	                           	<div class="form-group">
                                    <label class="control-label col-md-4 col-sm-4">주문일자</label>
                                    <div class="col-md-6 col-sm-6">
                                        <input type="text" class="form-control" id="s_odate" placeholder="20/01/01" name="odate"/>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-1"></div>
                         </div>
                      	<br>
	                        <div style="text-align: center;">
	                        <button type="button" onclick="selectOrder();" class="btn btn-sm btn-white">조회</button>
	                        <button type="button" onclick="initBtn();" class="btn btn-sm btn-default">초기화</button>
	                        </div>
                      </form>
                      <hr>
					<br>
					<!-- 주문내역 수정 팝업 -->
					<div class="modal fade" id="modal-modify">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<br>
										<br>
										<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
										<h4 class="modal-title" style="text-align: center; font-weight: bold;">주문 내역 수정</h4>
									</div>
									<!-- 주문 수정 form -->
									<form class="form-horizontal">
									<div class="modal-body">
									<input type="hidden" name="ono" id="m_ono">
			                                <div class="form-group">
			                                    <label class="control-label col-md-4 col-sm-4">회원 ID :</label>
			                                    <div class="col-md-6 col-sm-6">
			                                        <input type="text" class="form-control" style="float: left;" name="oid" id="m_oid" disabled="disabled">
			                                    </div>
			                                </div>
			                                <div class="form-group">
			                                    <label class="control-label col-md-4 col-sm-4">주문 수량 :</label>
			                                    <div class="col-md-6 col-sm-6">
			                                        <input type="text" class="form-control" placeholder="수량" style="float: left;" name="oqty" id="m_oqty" disabled="disabled">
			                                    </div>
			                                </div>
			                                <div class="form-group">
			                                    <label class="control-label col-md-4 col-sm-4">주문 상태 :</label>
			                                    <div class="col-md-6 col-sm-6">
			                                        <select class="form-control" name="ostate" id="m_ostate">
			                                            <option value="1">주문완료</option>
			                                            <option value="2">배송중</option>
			                                            <option value="3">배송완료</option>
			                                        </select>
			                                    </div>
			                                </div>                                
				                            <div class="form-group">
				                                    <label class="control-label col-md-4 col-sm-4">도서코드 :</label>
				                                    <div class="col-md-6 col-sm-6">
				                                        <input type="text" class="form-control" placeholder="도서코드" name="bcode" id="m_bcode" disabled="disabled"/>
				                                    </div>
				                            </div>
										</div>
										<div class="modal-footer">
											<a href="javascript:;" class="btn btn-sm btn-white" data-dismiss="modal">닫기</a>
											<button type="button" onclick="modifyOrder();" class="btn btn-sm btn-primary">수정</button>
										</div>
		                            	</form>
									</div>
								</div>
						</div>
						<!-- 메인화면 테이블 -->
						<table id="data-table" class="table table-striped table-bordered">
							<thead>
								<tr>
									<th style="text-align: center;">주문번호</th>
									<th style="text-align: center;">회원 ID</th>
									<th width="150" style="text-align: center;">도서명</th>
									<th style="text-align: center;">출판사</th>
									<th style="text-align: center;">주문수량</th>
									<th style="text-align: center;">주문금액</th>
									<th style="text-align: center;">주문일자</th>
									<th style="text-align: center;">진행상태</th>
									<th width="100" style="text-align: center;">관리</th>
								</tr>
							</thead>
							<tbody id="orderTablePlace">

							</tbody>
						</table>
						</div>
					</div>
				</div>
		  </div>
	</div>

		<!-- ================== BEGIN BASE JS ================== -->
		<script src="${pageContext.request.contextPath}/resources/assets/plugins/jquery/jquery-1.9.1.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/assets/plugins/jquery/jquery-migrate-1.1.0.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/assets/plugins/jquery-ui/ui/minified/jquery-ui.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
		<!--[if lt IE 9]>
		<script src="assets/crossbrowserjs/html5shiv.js"></script>
		<script src="assets/crossbrowserjs/respond.min.js"></script>
		<script src="assets/crossbrowserjs/excanvas.min.js"></script>
	<![endif]-->
		<script src="${pageContext.request.contextPath}/resources/assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>
		<script src="${pageContext.request.contextPath}/resources/assets/plugins/jquery-cookie/jquery.cookie.js"></script>
		<!-- ================== END BASE JS ================== -->

		<!-- ================== BEGIN PAGE LEVEL JS ================== -->
		<script src="${pageContext.request.contextPath}/resources/assets/js/apps.min.js"></script>
	<!-- 인사관리 추가 버튼 -->
	<script src="${pageContext.request.contextPath}/resources/assets/plugins/gritter/js/jquery.gritter.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/ui-modal-notification.demo.min.js"></script>
	<!-- 이메일 input -->
	<script src="${pageContext.request.contextPath}/resources/assets/plugins/parsley/dist/parsley.js"></script>
	<!-- 생년월일,입사날짜,전화번호 -->
	<script src="${pageContext.request.contextPath}/resources/assets/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/plugins/ionRangeSlider/js/ion-rangeSlider/ion.rangeSlider.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/plugins/bootstrap-colorpicker/js/bootstrap-colorpicker.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/plugins/masked-input/masked-input.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/plugins/bootstrap-timepicker/js/bootstrap-timepicker.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/plugins/password-indicator/js/password-indicator.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/plugins/bootstrap-combobox/js/bootstrap-combobox.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/plugins/bootstrap-select/bootstrap-select.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/plugins/bootstrap-tagsinput/bootstrap-tagsinput.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/plugins/bootstrap-tagsinput/bootstrap-tagsinput-typeahead.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/plugins/jquery-tag-it/js/tag-it.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/plugins/bootstrap-daterangepicker/moment.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/plugins/bootstrap-daterangepicker/daterangepicker.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/plugins/select2/dist/js/select2.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/plugins/bootstrap-eonasdan-datetimepicker/build/js/bootstrap-datetimepicker.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/form-plugins.demo.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/apps.min.js"></script>
	<!-- 이미지 파일 업로드 -->
	<script src="${pageContext.request.contextPath}/resources/assets/plugins/jquery-file-upload/js/vendor/jquery.ui.widget.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/plugins/jquery-file-upload/js/vendor/tmpl.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/plugins/jquery-file-upload/js/vendor/load-image.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/plugins/jquery-file-upload/js/vendor/canvas-to-blob.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/plugins/jquery-file-upload/blueimp-gallery/jquery.blueimp-gallery.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/plugins/jquery-file-upload/js/jquery.iframe-transport.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/plugins/jquery-file-upload/js/jquery.fileupload.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/plugins/jquery-file-upload/js/jquery.fileupload-process.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/plugins/jquery-file-upload/js/jquery.fileupload-image.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/plugins/jquery-file-upload/js/jquery.fileupload-audio.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/plugins/jquery-file-upload/js/jquery.fileupload-video.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/plugins/jquery-file-upload/js/jquery.fileupload-validate.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/plugins/jquery-file-upload/js/jquery.fileupload-ui.js"></script>
    <!--[if (gte IE 8)&(lt IE 10)]>
        <script src="assets/plugins/jquery-file-upload/js/cors/jquery.xdr-transport.js"></script>
    <![endif]-->
	<script src="${pageContext.request.contextPath}/resources/assets/js/form-multiple-upload.demo.min.js"></script>
		
	<!-- 주문조회 테이블 -->
	<script src="${pageContext.request.contextPath}/resources/assets/plugins/DataTables/media/js/jquery.dataTables.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/plugins/DataTables/media/js/dataTables.bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/plugins/DataTables/extensions/ColReorder/js/dataTables.colReorder.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/plugins/DataTables/extensions/Responsive/js/dataTables.responsive.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/form-multiple-upload.demo.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/table-manage-colreorder.demo.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/apps.min.js"></script>
	
	<script>
	
		$(document).ready(function() {
			App.init();
			TableManageTableSelect.init();
		});
		
	/* 초기화 버튼 */
		function initBtn() {
			displayOrder();
	 		$("#s_oid").val("");
	 		$("#s_ostate").val("");
	 		$("#s_odate").val("");
		}
			

	/* 주문 조회 리스트*/
	
		function displayOrder() {
			$.ajax({
				type: "GET",
				url: "order_list",
				dataType: "json",
				success: function(json) {
					if(json.length==0) {
						var html="<tr><td class='center' colspan='9'>등록된 주문내역이 존재하지 않습니다.</td></tr>";
						$("#orderTablePlace").html(html);
						return;
					}
					
					var html="";
					$(json).each(function() {	
						var state="";
						if(this.ostate=="1") state="주문완료";
						if(this.ostate=="2") state="배송중";
						if(this.ostate=="3") state="배송완료";
						
						html+="<tr>";
						html+="<td>"+this.ono+"</td>";
						html+="<td>"+this.oid+"</td>";
						html+="<td>"+this.book.bname+"</td>";
						html+="<td>"+this.book.bpublisher+"</td>";
						html+="<td>"+this.oqty+"</td>";
						html+="<td>"+this.oprice+"</td>";
						html+="<td>"+this.odate+"</td>";
						html+="<td>"+state+"</td>";
						if(state!=3) {
						html+="<td><button onclick='deleteOrder("+this.ono+");' class='btn btn-sm btn-white'>삭제</button> "
						+" <button href='#modal-modify' class='btn btn-sm btn-success' data-toggle='modal' id='modify_link' data-id="+this.ono+">수정</button></td>";
						} else {
							html+="-";
						}
						html+="</tr>";
					
						
					});
				
					
					$("#data-table").dataTable().fnDestroy();
					$("#data-table").dataTable(); 
					$("#orderTablePlace").html(html);
					
				},
				error: function(xhr) {
					alert("에러코드 = "+xhr.status);
				}
			});
		}
		
		displayOrder();
	 
	 
	/* 주문 삭제 */
		function deleteOrder(ono) {
			if(confirm("주문내역을 삭제하시겠습니까?")) {
				location.href="order_delete/"+ono;
			}
		}
	 
	/* 테이블에 있는 수정 클릭 시 입력했던 값 가져오기  */
 		
 		$(document).on("click", "#modify_link", function() {
 				var ono=$(this).data("id");
 				$("#m_ono").val(ono); 
 				
 				$.ajax({
 					type: "GET",
 					url: "order_view/"+ono,
 					dataType: "json",
 					success: function(json) {
 						$("#m_oid").val(json.oid);
 						$("#m_oqty").val(json.oqty);
 						$("#m_ostate").val(json.ostate);
 						$("#m_bcode").val(json.bcode);
			
 					},
 					error: function(xhr) {
 						alert("에러코드 = "+xhr.status);
 					}
 				});
 			});
	
 	/* 주문 수정 데이터 보내기 */
 		
 		function modifyOrder() {
 			var ono=$("#m_ono").val();
 			var oid=$("#m_oid").val();
 			var oqty=$("#m_oqty").val();
 			var ostate=$("#m_ostate").val();
 			var bcode=$("#m_bcode").val();
 			
 			$.ajax({
 				type: "PUT",
 				url: "order_modify",
 				headers: {"content-type":"application/json", "X-HTTP-Method-override":"PUT"},
 				data: JSON.stringify({ 
 					"ono":ono,
 					"oid":oid,
 					"oqty":oqty,
 					"ostate":ostate, 
 					"bcode":bcode,		
 				}),
 				dataType: "text",
 				success: function(text) {
 					if(text=="success") {					
 						location.reload();
 					}
 				},
 				error: function(xhr) {
 					alert("에러 발생 코드 "+xhr.status);				
 				}
 			});	
 		} 
 	
 	
	/* 검색 내역 리스트 */
 		
 		function selectOrder() {
	 		var oid=$("#s_oid").val();
	 		var ostate=$("#s_ostate").val();
	 		var odate=$("#s_odate").val();
 		
	 		$.ajax({
	 			type: "POST",
	 			url: "order_search",
	 			headers: {"content-type":"application/json"},
	 			data: JSON.stringify({
	 				"oid":oid,
	 				"ostate":ostate,
	 				"odate":odate
	 				}),
	 			dataType: "json",
	 			success: function(json) {
						if(json.length==0) {
							var html="<tr><td class='center' colspan='9'>검색된 주문내역이 없습니다.</td></tr>";
							$("#orderTablePlace").html(html);
							return;
						}
	 					
	 					var html="";
	 					$(json).each(function() {
	 						var state="";
							if(this.ostate=="1") state="주문완료";
							if(this.ostate=="2") state="배송중";
							if(this.ostate=="3") state="배송완료";
							
							html+="<tr>";
							html+="<td>"+this.ono+"</td>";
							html+="<td>"+this.oid+"</td>";
							html+="<td>"+this.book.bname+"</td>";
							html+="<td>"+this.book.bpublisher+"</td>";
							html+="<td>"+this.oqty+"</td>";
							html+="<td>"+this.oprice+"</td>";
							html+="<td>"+this.odate+"</td>";
							html+="<td>"+state+"</td>";		
							if(state!=3) {
							html+="<td><button onclick='deleteOrder("+this.ono+");' class='btn btn-sm btn-white'>삭제</button> "
							+" <button href='#modal-modify' class='btn btn-sm btn-success' data-toggle='modal' id='modify_link' data-id="+this.ono+">수정</button></td>";
							} else {
								html+=" ";
							}
							html+="</tr>";
	 					});
	 					
						$("#data-table").dataTable().fnDestroy();
						$("#data-table").dataTable(); 
	 					$("#orderTablePlace").html(html);
	 				},
	 				error: function(xhr) {
	 					alert("에러 발생 = "+xhr.status);
	 				}
	 			});
	 		}
	 	 	
	</script>
</body>
</html>