<%@page import="java.lang.reflect.Array"%>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="dao.ItemsDAO"%>
 <%@ page import="entity.Items" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商品详情页面</title>
</head>
<h1>商品详情</h1>
<hr>
<center>
	<table width="750" height="60" cellpadding="0" border="0">
		<tr>
			<!-- 商品详情 -->
			<%
				ItemsDAO itemsDao = new ItemsDAO();
				Items item = itemsDao.getItemsById(Integer.parseInt(request.getParameter("id")));
				if(item != null) {
					
				
			%>
			<td width="70%" valign="top">
				<table>
				<tr>
					<td rowspan="4"><img src="images/<%=item.getPicture() %>" width="200" height="160" border="0"/></td>
				</tr>
				<tr>
					<td><%=item.getName() %></td>
				</tr>
				<tr>
					<td>产地：<%=item.getCity() %></td>
				</tr>
				<tr>
					<td>价格：<%=item.getPrice() %>￥</td>
				</tr>
				</table>
			</td>
			<%
				}
			%>
			<%
				String list = "";
			//从客户端获得Cookies集合
			Cookie[] cookies = request.getCookies();
			//遍历Cookies集合
			if(cookies != null && cookies.length>0) {
				for(Cookie c:cookies) {
					if(c.getName().equals("ListViewCookie")) {
						list = c.getValue();
					}
				}
			}
			list += request.getParameter("id")+",";
			//如果浏览记录超过1000条，清零
			String[] arr = list.split(",");
			if(arr != null && arr.length>0) {
				if(arr.length >= 1000) {
					list = "";
				}
			}
			Cookie cookie = new Cookie("ListViewCookie",list);
			response.addCookie(cookie);
			%>
			<!-- 浏览过的商品 -->
			<td width="30%" bgcolor="#EEE" align="center">
			<br>
			<b>您浏览过的商品</b><br>
			<!-- 循环开始 -->
			<%
				ArrayList<Items> itemlist = itemsDao.getViewList(list);
				if(itemlist != null && itemlist.size()>0) {
				for(Items i:itemlist) {
					
				
			%>
			<div>
				<dl>
					<dt>
						<a href="detail.jsp?id=<%=i.getId() %>"><img src="images/<%=i.getPicture() %>" width="120" height="90" border="1"/></a>
					</dt>
					<dd class="dd_name"><%=i.getName() %></dd>
					<dd>产地：<%=i.getCity() %>&nbsp;&nbsp;价格：<%=i.getPrice() %> ￥</dd>
				</dl>
			</div>
			<%
				}
					}
			%>
			<!-- 循环结束 -->
			</td>
	</table>
</center>
</body>
</html>