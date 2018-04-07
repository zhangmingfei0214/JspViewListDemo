<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="dao.ItemsDAO"%>
 <%@ page import="entity.Items" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商品首页</title>
</head>
<body>
<h1>商品展示</h1>
<hr>
<center>
	<table width="750" height="60" cellpadding="0" border="0">
		<tr>
			<td>
			<!-- 商品循环开始 -->
			<%
				ItemsDAO itemsDao = new ItemsDAO();
				ArrayList< Items> list = itemsDao.getAllItems();
				if(list != null && list.size()>0) {
					
					for(int i=0;i<list.size();i++) {
						Items item = list.get(i);
			%>
				<div>
					<dl>
						<dt>
							<a href="detail.jsp"?id=<%=item.getId() %>>
								<img src="images/<%=item.getPicture() %>" width="120" height="60" border="0"/>
							</a>
						</dt>
						<dd class="dd_name"><%=item.getName() %></dd>
						<dd class="dd_city">产地：<%=item.getCity() %>&nbsp;&nbsp;价格：￥<%=item.getPrice() %></dd>
					</dl>
				</div>
				<!-- 商品循环结束 -->
				<%
					}
						}
				%>
			</td>
	</table>
</center>
</body>
</html>