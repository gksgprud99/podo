<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
		<jsp:include page="../common/header.jsp"/>
		<title>영화 검색</title>
		<style>
			
			#search-film-result {
				border-collapse: collapse;
			}
			
			#search-film-result td,
			#search-film-result tr {
				text-align: center;
				border: 1px solid;
			}
			
			.card-img {
				object-fit: cover;
				height: 420px;
			}
			
			.single-recent-blog-post .thumb {
		    overflow: hidden;
		    border-radius: 10px;
		    border: 1px solid #b3bfdd;
			}
			
		</style>
	</head>
	<body>

		  <!--================ Start Blog Post Area =================-->
		  <section class="blog-post-area section-margin">
		    <div class="container">
		      <div class="row">
		        <div class="col-lg-8">
		        
		        	<!-- 검색된 컨텐츠 -->
		          <div class="row">
								<c:forEach items="${ list }" var="f">
			            <div class="col-md-6">
			              <div class="single-recent-blog-post card-view">
			                <div class="thumb">
					            	<c:choose>
					            		<c:when test="${ not empty f.poster }">
							              <img class="card-img rounded-0" src="resources/detailFilmImage/${ f.poster }" alt="">
					            		</c:when>
					            		<c:otherwise>
							              <img class="card-img rounded-0" src="resources/detailFilmImage/podoposter.jpg" alt="">
					            		</c:otherwise>
					            	</c:choose>
			                  <ul class="thumb-info">
			                    <li><a href="detailFilm.do?filmId=${f.id}"><i class="ti-user"></i>${ f.director }</a></li>
			                    <li><a href="detailFilm.do?filmId=${f.id}"><i class="ti-themify-favicon"></i>${ f.releaseYear }</a></li>
			                  </ul>
			                </div>
			                <div class="details mt-20">
			                  <a href="detailFilm.do?filmId=${f.id}">
			                    <h3>${ f.titleKor }</h3>
			                  </a>
			                  <p>${ f.titleEng } / ${ f.productionCountry } / ${ f.genre }</p>
			                  <a class="button" href="detailFilm.do?filmId=${f.id}">더보기<i class="ti-arrow-right"></i></a>
			                </div>
			              </div>
			            </div>
		          	</c:forEach>
		          </div>
		          
		          <c:url var="keywordSearchUrl" value="skFilm.do">
								<c:param name="keyword" value="${ keyword }" />
								<c:param name="skeyword" value="${ skeyword }" />
							</c:url>
		          <!-- Pagination -->
		          <div class="row">
		            <div class="col-lg-12">
	                <nav class="blog-pagination justify-content-center d-flex">
                    <ul class="pagination">
                   		
                   		<!-- [PREV] -->
                      <c:if test="${ pi.currentPage eq 1 }">
												<li class="page-item disabled">
											</c:if>
											<c:if test="${ pi.currentPage ne 1 }">
												<li class="page-item">
											</c:if>
                         <a href=<c:out value="${ keywordSearchUrl }&p=${ pi.currentPage - 1 }"/> class="page-link" aria-label="Previous" disabled>
                           &lt;
                        </a>
                      </li>
                       
                      <!-- [각 페이지] -->
											<c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
											
                     		<c:if test="${ p eq pi.currentPage }">
                     			<li class="page-item disabled"><a href=<c:out value="${ keywordSearchUrl }&p=${ p }"/> class="page-link">${ p }</a></li>
												</c:if>
												<c:if test="${ p ne pi.currentPage }">
                     			<li class="page-item"><a href=<c:out value="${ keywordSearchUrl }&p=${ p }"/> class="page-link">${ p }</a></li>
												</c:if>
                     		
                      </c:forEach>
                       
                      <!-- [NEXT] -->
                      <c:if test="${ pi.currentPage eq pi.maxPage }">
												<li class="page-item disabled">
											</c:if>
											<c:if test="${ pi.currentPage ne pi.maxPage }">
												<li class="page-item">
											</c:if>
												<a href=<c:out value="${ keywordSearchUrl }&p=${ pi.currentPage + 1 }"/> class="page-link" aria-label="Next">
                           &gt;
                        </a>
                      </li>
                    </ul>
	                </nav>
		            </div>
		          </div>
		          
		        </div>
		
		        <!-- Start Blog Post Siddebar -->
		        <div class="col-lg-4 sidebar-widgets">
		            <div class="widget-wrap">
		              <div class="single-sidebar-widget newsletter-widget">
		                <h4 class="single-sidebar-widget__title">결과 내 재검색</h4>
		                <div class="form-group mt-30">
		                  <div class="col-autos">
		                    <input type="search" class="form-control" id="inlineFormInputGroup" placeholder="키워드를 입력해주세요" name="skeyword"
		                    	onfocus="this.placeholder = ''" onblur="this.placeholder = '키워드를 입력해주세요'">
		                  </div>
		                </div>
		                <button class="bbtns d-block mt-20 w-100">검색</button>
		              </div>
		
		
		              <div class="single-sidebar-widget post-category-widget">
		                <h4 class="single-sidebar-widget__title">카테고리</h4>
		                <ul class="cat-list mt-20">
		                  <li>
		                    <a href="<c:out value="${ keywordSearchUrl }&p=1"/>" class="d-flex justify-content-between">
		                      <p>영화</p>
		                      <c:if test="${ filmCount lt 10 }">
			                      <p>(0${ filmCount })</p>
		                      </c:if>
		                      <c:if test="${ filmCount ge 10 }">
			                      <p>(${ filmCount })</p>
		                      </c:if>
		                    </a>
		                  </li>
		                  <li>
		                    <a href="#" class="d-flex justify-content-between">
		                      <p>리뷰</p>
		                      <c:if test="${ listCount lt 10 }">
			                      <p>(0${ listCount })</p>
		                      </c:if>
		                      <c:if test="${ listCount ge 10 }">
			                      <p>(${ listCount })</p>
		                      </c:if>
		                    </a>
		                  </li>
		                  <li>
		                    <a href="#" class="d-flex justify-content-between">
		                      <p>자유게시판</p>
		                      <c:if test="${ listCount lt 10 }">
			                      <p>(0${ listCount })</p>
		                      </c:if>
		                      <c:if test="${ listCount ge 10 }">
			                      <p>(${ listCount })</p>
		                      </c:if>
		                    </a>
		                  </li>
		                </ul>
		              </div>
		
		              <div class="single-sidebar-widget popular-post-widget">
		                <h4 class="single-sidebar-widget__title">박스 오피스</h4>
		                <div class="popular-post-list">
		                  <div class="single-post-list">
		                  	<table>
		                  		<thead>
		                  			<tr>
		                  				<th>1</th>
		                  				<th>2</th>
		                  				<th>3</th>
		                  			</tr>
		                  		</thead>
		                  		<tbody>
		                  			<tr>
		                  				<td>a</td>
		                  				<td>s</td>
		                  				<td>d</td>
		                  			</tr>
		                  		</tbody>
		                  	</table>
		                  </div>
		                </div>
		              </div>
		
		                <div class="single-sidebar-widget tag_cloud_widget">
		                  <h4 class="single-sidebar-widget__title">인기 키워드</h4>
		                  <ul class="list">
		                    <li>
		                        <a href="skFilm.do?keyword=조커">#조커</a>
		                    </li>
		                    <li>
		                        <a href="skFilm.do?keyword=미인어">#미인어</a>
		                    </li>
		                    <li>
		                        <a href="skFilm.do?keyword=감쪽같은 그녀">#감쪽같은 그녀</a>
		                    </li>
		                    <li>
		                        <a href="skFilm.do?keyword=매드 맥스">#매드 맥스</a>
		                    </li>
		                  </ul>
		                </div>
		              </div>
		            </div>
		          </div>
		        <!-- End Blog Post Siddebar -->
		      </div>
		  </section>
		  <!--================ End Blog Post Area =================-->
	  <jsp:include page="../common/footer.jsp"/>
	</body>
</html>