<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="pagination-container">
    <a class="btn btn-info"
       <c:if test="${page.pageNumber==1}">disabled</c:if>
            <c:if test="${page.pageNumber!=1}">
                href="${param.url}?pageNumber=1${param.param}"
            </c:if>>First</a>
    <a class="btn btn-info"
       <c:if test="${page.pageNumber==1}">disabled</c:if>
       <c:if test="${page.pageNumber!=1}">href="${param.url}?pageNumber=${page.pageNumber-1}${param.param}"
    </c:if>>Previous</a>
    <h3 style='display: inline';>[${page.pageNumber}/${page.totalPages}]</h3>
    <h3 style='display: inline';>[${page.totalElements}]</h3>
    <a class="btn btn-info"
       <c:if test="${page.totalPages==0 || page.pageNumber==page.totalPages}">disabled</c:if>
       <c:if test="${page.pageNumber!=page.totalPages}">href="${param.url}?pageNumber=${page.pageNumber+1}${param.param}" </c:if>>Next</a>
    <a class="btn btn-info"
       <c:if test="${page.totalPages==0 || page.pageNumber==page.totalPages}">disabled</c:if>
            <c:if test="${page.pageNumber!=page.totalPages}">
                href="${param.url}?pageNumber=${page.totalPages}${param.param}"  </c:if>>Last</a>
    <input type="text" class="form-control" style="display: inline;width: 60px;" value="">
    <a class="btn btn-info" onclick='location.href="${param.url}?pageNumber="+(this.previousSibling.value)+"${param.param}"'>GO</a>
</div>