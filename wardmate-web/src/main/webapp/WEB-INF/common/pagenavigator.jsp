<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="com.wardmate.vo.PageQueryResult" %>
<%--<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<c:if test="${pageResult != null}">
    <div style="display: flex;justify-content: center;align-items: center;">
    <nav class="page_number text-center">
        <%
            PageQueryResult pageResult = (PageQueryResult) request.getAttribute("pageResult");
            int pageIndex = pageResult.getPageIndex();
            int pageCount = pageResult.getPageCount();
            int DEFAULT_INDEX_COUNT = 5;
            int h1 = DEFAULT_INDEX_COUNT / 2;
            int h2 = DEFAULT_INDEX_COUNT - h1;
            //from与to两个int界定分页指示器两个...间按钮的添加，满足1<=from<to<=pageCount
            int from = pageIndex - h2 + 1;
            int to;
            for (to = pageIndex + h1; from < 1 && to < pageCount; to++) {from++;}
            for (; to > pageCount && from > 1; to--) {from--;}
            if (from < 2) {from = 2;}
            if (to > pageCount) {to = pageCount;}
        %>
        <!--recordCount是整个记录的条数-->
        <span class="text"><span class="active"><%=pageIndex %></span>/<%=pageCount %>页，共${pageResult.recordCount}条</span>
        <ul class="pagination" style="display: inline;">
            <c:if test="${pageResult.pageIndex > 1 }">
                <li><a href="javascript:doQuery(${pageResult.pageIndex } - 1)" aria-label="Previous"><span
                        aria-hidden="true">上一页</span></a></li>
            </c:if>
            <li><a href="javascript:doQuery(1)" <c:if test="${pageResult.pageIndex == 1 }">class="active"</c:if>><%=1 %>
            </a>
                        <%
            if (from > 2 && pageCount > DEFAULT_INDEX_COUNT) {
            %>
            <li><span class="dot">…</span></li>
            <%
            }
            %>
            <%
                for (int i = from; i <= to; i++) {
                    if (i != pageIndex) {
            %>
            <li><a href="javascript:doQuery(<%=i %>)"><%=i %>
            </a></li>
            <% } else { %>
            <li><a href='#' class="active"><%=i %>
            </a></li>
            <%
                    }
                }
            %>
            <%
                if (pageCount - to > 1) {
            %>
            <li><span class="dot">…</span></li>
            <%
                }
            %>
            <%
                if (pageCount > to) {
            %>
            <li><a href="javascript:doQuery(<%=pageCount%>)" <c:if
                    test="${pageResult.pageIndex == pageResult.pageCount }"> class="active"</c:if>><%=pageCount %>
            </a>
                        <%
            }
            %>
                <c:if test="${pageResult.pageIndex < pageResult.pageCount }">
            <li><a href="javascript:doQuery(${pageResult.pageIndex + 1})" aria-label="Next"><span
                    aria-hidden="true">下一页</span></a></li>
            </c:if>
        </ul>
        <span class="text"><input id="givePageIndex" type="text" style="width: 35px;height: 35px;">
            <a href="javascript:doQueryToGivenPage()">跳</a>
        </span>
        <script>
            function doQueryToGivenPage() {
                var index = $("#givePageIndex").val();
                if (index > 0)
                    doQuery(index)
            }
        </script>
    </nav>
    </div>
</c:if>