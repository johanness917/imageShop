<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<hr style="margin-top: 30px;">
<div id="reply-container"
	style="width: 80%; margin: 0 auto; text-align: left;">
	<h3 style="border-bottom: 2px solid #333; padding-bottom: 10px;">댓글</h3>

	<div id="replies" style="margin-bottom: 20px;"></div>

	<sec:authorize access="isAuthenticated()">
		<sec:authentication property="principal.username" var="p_username" />
		<div
			style="background: #f8f9fa; border: 1px solid #ddd; padding: 15px; border-radius: 5px;">
			<p style="margin-bottom: 5px;">
				<strong>${p_username}</strong>
			</p>
			<textarea id="newReplyText"
				style="width: 100%; height: 70px; padding: 10px; box-sizing: border-box; border: 1px solid #ccc; border-radius: 3px; resize: none;"></textarea>
			<div style="text-align: right; margin-top: 10px;">
				<button type="button" id="btnReplyAdd"
					style="padding: 8px 20px; background: #333; color: #fff; border: none; cursor: pointer; border-radius: 3px;">댓글
					등록</button>
			</div>
		</div>
	</sec:authorize>
</div>

<script>
	$(document)
			.ready(
					function() {
						const boardNo = $("#boardNo").val();
						const loginUser = "${p_username}";

						// 1. 댓글 목록 불러오기 (GET)
						function getReplyList() {
							$
									.getJSON(
											"/reply/all/" + boardNo,
											function(data) {
												let str = "";
												$(data)
														.each(
																function() {
																	let margin = this.parentNo > 0 ? "40px"
																			: "0px";
																	let bgColor = this.parentNo > 0 ? "#fdfdfd"
																			: "#fff";
																	let icon = this.parentNo > 0 ? "└ [답글] "
																			: "";

																	str += "<div class='replyLi' data-rno='" + this.replyNo + "' style='margin-left: " + margin + "; background-color: " + bgColor + "; border-bottom: 1px solid #eee; padding: 15px;'>";
																	str += "  <div style='display: flex; justify-content: space-between;'>";
																	str += "    <strong>"
																			+ icon
																			+ this.replyer
																			+ "</strong>";
																	str += "    <div>";
																	str += "      <small style='color: #999;'>"
																			+ new Date(
																					this.regDate)
																					.toLocaleString()
																			+ "</small>";

																	if (loginUser === this.replyer) {
																		str += " <button type='button' class='btnReplyModify' style='margin-left:10px; cursor:pointer; font-size:11px; border:1px solid #ccc; background:#fff;'>수정</button>";
																		str += " <button type='button' class='btnReplyDelete' style='margin-left:5px; cursor:pointer; font-size:11px; border:1px solid #ccc; background:#fff;'>삭제</button>";
																	}

																	str += "    </div>";
																	str += "  </div>";
																	str += "  <div class='replyText' style='margin-top: 8px; white-space: pre-wrap; color: #333;'>"
																			+ this.replyText
																			+ "</div>";
																	str += "</div>";
																});

												if (data.length === 0) {
													str = "<div style='padding: 30px; text-align: center; color: #999;'>등록된 댓글이 없습니다.</div>";
												}
												$("#replies").html(str);
											});
						}

						getReplyList();

						// 2. 댓글 등록 (POST)
						$("#btnReplyAdd").on("click", function() {
							const replyText = $("#newReplyText").val();
							if (replyText.trim() === "") {
								alert("내용을 입력해주세요.");
								return;
							}

							$.ajax({
								type : 'post',
								url : '/reply',
								headers : {
									"Content-Type" : "application/json"
								},
								data : JSON.stringify({
									boardNo : boardNo,
									replyText : replyText,
									replyer : loginUser,
									parentNo : 0
								}),
								success : function(result) {
									if (result === "SUCCESS") {
										alert("댓글이 등록되었습니다.");
										$("#newReplyText").val("");
										getReplyList();
									}
								}
							});
						});

						// 3. 수정 버튼 클릭 (입력창 전환)
						$(document)
								.on(
										"click",
										".btnReplyModify",
										function() {
											const replyLi = $(this).closest(
													".replyLi");
											const rno = replyLi.data("rno");
											const currentText = replyLi.find(
													".replyText").text();

											if (replyLi.find(".edit-area").length > 0)
												return;

											const editForm = "<div class='edit-area' style='margin-top:10px;'>"
													+ "  <textarea class='editReplyText' style='width:100%; height:60px; padding:5px; border:1px solid #ddd;'>"
													+ currentText
													+ "</textarea>"
													+ "  <div style='text-align:right; margin-top:5px;'>"
													+ "    <button type='button' class='btnUpdateSubmit' data-rno='" + rno + "' style='font-size:11px; padding:3px 8px; cursor:pointer;'>저장</button>"
													+ "    <button type='button' class='btnUpdateCancel' style='font-size:11px; padding:3px 8px; cursor:pointer;'>취소</button>"
													+ "  </div>" + "</div>";

											replyLi.find(".replyText").hide();
											replyLi.append(editForm);
											$(this).hide();
										});

						// 4. 수정 취소
						$(document).on("click", ".btnUpdateCancel", function() {
							const replyLi = $(this).closest(".replyLi");
							replyLi.find(".replyText").show();
							replyLi.find(".edit-area").remove();
							replyLi.find(".btnReplyModify").show();
						});

						// 5. 수정 저장 (POST 방식으로 변경된 URL 사용)
						$(document).on(
								"click",
								".btnUpdateSubmit",
								function() {
									const rno = $(this).data("rno");
									const replyText = $(this).closest(
											".edit-area")
											.find(".editReplyText").val();

									$.ajax({
										type : 'post', // PUT 대신 POST
										url : '/reply/modify/' + rno, // 컨트롤러 주소와 맞춰야 함
										headers : {
											"Content-Type" : "application/json"
										},
										data : JSON.stringify({
											replyNo : rno,
											replyText : replyText
										}),
										success : function(result) {
											if (result === "SUCCESS") {
												alert("댓글이 수정되었습니다.");
												getReplyList();
											}
										}
									});
								});

						// 6. 삭제 실행 (POST 방식으로 변경된 URL 사용)
						$(document).on(
								"click",
								".btnReplyDelete",
								function() {
									const replyNo = $(this).closest(".replyLi")
											.data("rno");
									if (confirm("삭제하시겠습니까?")) {
										$.ajax({
											type : 'post', // DELETE 대신 POST
											url : '/reply/remove/' + replyNo, // 컨트롤러 주소와 맞춰야 함
											success : function(result) {
												if (result === "SUCCESS") {
													alert("삭제되었습니다.");
													getReplyList();
												}
											}
										});
									}
								});
					});
</script>