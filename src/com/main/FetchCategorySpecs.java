package com.main;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.Response;

import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.sun.jersey.api.view.Viewable;
import com.main.DataLoader;

@Path("/fetch")
public class FetchCategorySpecs {
	

	@GET
	@Produces("text/html")
	@Path("/products/{category}")
	public Response fetchCategorySpec(@PathParam("category") String category , @Context HttpServletRequest context) {
		
		DBCollection categoryColl =  DataLoader.getDb().getCollection(category);
		
		DBCursor cursor = categoryColl.find();
		
		List<DBObject> productList = cursor.toArray();
		
		List<Map<String,String>> productMapList = new ArrayList<Map<String, String>>();
		
		for(DBObject product : productList){
			product.removeField("_id");
			Map<String, String> productMap = product.toMap();
			productMapList.add(productMap);
		}
			
			context.setAttribute("imageUrl", DataLoader.imageMap.get(category));
		
		context.setAttribute("category",category);
		return Response.ok(new Viewable("/viewProducts", productMapList)).build();
	}	
}
