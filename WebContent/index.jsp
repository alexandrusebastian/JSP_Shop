<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="framework.*, dao.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Index</title>
</head>
<body>
	<h1>
	Welcome 
	<% 
		User u = new User();
		u.setUsername("Sebi");
		u.setPassword("password");
		
		UserDAO user_dao = new UserDAOSQL();
		//user_dao.register(u);
		User logged_in_user = user_dao.login("Sebi", "password");
	%>
	<%=logged_in_user.getUsername() %>
	<br>
				
	<% 
		EntityDAO entity_dao = new EntityDAOSQL();

		Entity e = new Entity(); 
		e.setId(1);
		e.setName("E1");
		e.setDescription("Description");
		e.setCategory("Category");
		e.setQuantity(5);
		entity_dao.add(e);
		
		e = new Entity(); 
		e.setId(2);
		e.setName("E2");
		e.setDescription("Description");
		e.setCategory("Category");
		e.setQuantity(5);
		entity_dao.add(e);
		
		e = new Entity(); 
		e.setId(3);
		e.setName("E3");
		e.setDescription("Description");
		e.setCategory("Category");
		e.setQuantity(5);
		entity_dao.add(e);
		e.setName("E4");
		entity_dao.update(e);
		
		for(Entity entity: entity_dao.getAll()) {
	%>
			<h2><%=entity.toString()%></h2> <br>
	<% 
		} 
		
		e.setQuantity(2);
	%>Buying: <%=e.toString()%> 
	<%
		u.addToCart(e);
		user_dao.checkout(u);
		
		%><br> After update: <br><%
		
		for(Entity entity: entity_dao.getAll()) {
		%>
				<h2><%=entity.toString()%></h2> <br>
		<% 
		} 
	%>
	</h1>
</body>
</html>