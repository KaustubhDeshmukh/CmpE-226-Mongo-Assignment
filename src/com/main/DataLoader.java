package com.main;

import java.io.FileReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.regex.Pattern;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.Response;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.MongoClient;
import com.mongodb.util.JSON;
import com.sun.jersey.api.view.Viewable;
import com.sun.jersey.spi.resource.Singleton;

@Path("/home")
@Singleton
public class DataLoader {

	private static final JSONParser parser = new JSONParser();

	private static final ObjectMapper mapper = new ObjectMapper(); 
	
	private static MongoClient mongoClient = null;
	
	private static DB db = null;
	
	public static final Map<String, String> imageMap = new HashMap<String,String>();


	public static DB getDb() {
		return db;
	}

	public DataLoader(@Context ServletContext context){

		try {
			mongoClient = new MongoClient();

			 db = mongoClient.getDB("226-product-db" );
		
			Object obj = parser.parse(new FileReader(context.getRealPath("/product.data")));

			JSONObject jsonObject = (JSONObject) obj;

			Set<String> keySet =  jsonObject.keySet();

			for(String key : keySet){

				System.out.println(key);

				JSONArray productArr = (JSONArray) jsonObject.get(key);
				
				DBCollection collection = db.getCollection(key);
				
				collection.ensureIndex(new BasicDBObject("Name", 1).append("unique", false) , "nameIndex1");

				for(int productIndex = 0 ; productIndex < productArr.size() ; productIndex++){

					JSONObject productObj = (JSONObject)productArr.get(productIndex);

					DBObject product = (DBObject) JSON.parse(productObj.toJSONString());				

					collection.insert(product);
				}
			}
			
			imageMap.put("TVs", "http://www.samsung.com/us/2012-smart-tv/img/intro-smartHubTV.png");
			imageMap.put("Books", "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcTg8jDQ6gWZ_b6KDW7GLc2OIcqa_Lr8Le89yCHA70gF2JFy6xNT");
			imageMap.put("Refrigerators", "http://www.jerrysappliancerepairnova.com/wp-content/uploads/2012/10/refrigerator-repair.jpg");
			imageMap.put("Perfumes", "http://www.magicfreebies.org/images/Perfume.png");

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@GET
	@Produces("text/html")
	public Response index() {
		
		Set<String> collSet = db.getCollectionNames();
		
		collSet.remove("system.indexes");
		
		return Response.ok(new Viewable("/catalog", collSet)).build();
	}
	
	@GET
	@Produces("text/html")
	@Path("/search/{searchQuery}")
	public Response searchProducts(@PathParam("searchQuery") String searchQuery , @Context HttpServletRequest context) {
		
		//searchQuery = searchQuery.substring(0, searchQuery.length() - 1);
		
		int matchedCategory = 0;
		
		searchQuery = searchQuery.toLowerCase();
		
		System.out.println("Submitted search query "+searchQuery);
		
		List<Map<String,String>> productMapList = new ArrayList<Map<String, String>>();
		
		if(searchQuery.equals("perfume") || searchQuery.equals("perfumes")){
			
			productMapList.addAll(categorySearch("Perfumes" , context , null));			
			matchedCategory++;
		}
		
		if(searchQuery.equals("book") || searchQuery.equals("books")){
			
			productMapList.addAll(categorySearch("Books" , context , null));			
			matchedCategory++;
		}
		
		if(searchQuery.equals("tv") || searchQuery.equals("tvs")){
			
			productMapList.addAll(categorySearch("TVs" , context , null));			
			matchedCategory++;
		}
		
		if(searchQuery.equals("refrigerators") || searchQuery.equals("refrigerator")){
			
			productMapList.addAll(categorySearch("Refrigerators" , context , null));			
			matchedCategory++;
		}
		
		if(matchedCategory > 1)
			context.setAttribute("imageUrl", "http://undercdn.under30media.netdna-cdn.com/wp-content/uploads/2013/05/Product-Value-300x300.jpg" );
		
		if(searchQuery.contains("perfume") || searchQuery.contains("perfumes")){
			
			String regex = "\\s*\\b(perfume|perfumes)\\b\\s*";
			
			searchQuery = searchQuery.replaceAll(regex, "");
			
			System.out.println("filtered query "+searchQuery);
			
			BasicDBObject query = new BasicDBObject();
			
			query.put("Name",  java.util.regex.Pattern.compile(".*?"+searchQuery+".*?",  Pattern.CASE_INSENSITIVE));
			
			productMapList.addAll(categorySearch("Perfumes" , context , query));
			
			matchedCategory++;
		}
		
		if(searchQuery.contains("book") || searchQuery.contains("books")){
			
			String regex = "\\s*\\b(book|books)\\b\\s*";
			
			searchQuery = searchQuery.replaceAll(regex, "");
			
			System.out.println("filtered query "+searchQuery);
			
			BasicDBObject query = new BasicDBObject();
			
			query.put("Name",  java.util.regex.Pattern.compile(".*?"+searchQuery+".*?",  Pattern.CASE_INSENSITIVE));
			
			productMapList.addAll(categorySearch("Books" , context , query));
			
			matchedCategory++;
		}
		
		if(searchQuery.contains("tv") || searchQuery.contains("tvs")){
			
			String regex = "\\s*\\b(tv|tvs)\\b\\s*";
			
			searchQuery = searchQuery.replaceAll(regex, "");
			
			System.out.println("filtered query "+searchQuery);
			
			BasicDBObject query = new BasicDBObject();
			
			query.put("Name",  java.util.regex.Pattern.compile(".*?"+searchQuery+".*?",  Pattern.CASE_INSENSITIVE));
			
			productMapList.addAll(categorySearch("TVs" , context , query));
			
			matchedCategory++;
		}
		
		if(searchQuery.contains("refrigerator") || searchQuery.contains("refrigerators")){
			
			String regex = "\\s*\\b(refrigerators|refrigerator)\\b\\s*";
			
			searchQuery = searchQuery.replaceAll(regex, "");
			
			System.out.println("filtered query "+searchQuery);
			
			BasicDBObject query = new BasicDBObject();
			
			query.put("Name",  java.util.regex.Pattern.compile(".*?"+searchQuery+".*?",  Pattern.CASE_INSENSITIVE));
			
			productMapList.addAll(categorySearch("Refrigerators" , context , query));
			
			matchedCategory++;
		}
		
		if(matchedCategory == 0){
			
			BasicDBObject query = new BasicDBObject();
			
			query.put("Name",  java.util.regex.Pattern.compile(".*?"+searchQuery+".*?",  Pattern.CASE_INSENSITIVE));
			
			for(String category : imageMap.keySet())
			productMapList.addAll(categorySearch(category , context , query));
			
		}
			
		return Response.ok(new Viewable("/search", productMapList)).build();
	}
	
	private List<Map<String,String>> categorySearch(String category, HttpServletRequest context , BasicDBObject query){
		
		DBCursor cursor = null;
		
		if(query != null)
		 cursor = db.getCollection(category).find(query);
		else
			cursor = db.getCollection(category).find();
		
		List<Map<String,String>> productMapList = new ArrayList<Map<String, String>>();
		
		List<DBObject> productList = cursor.toArray();
		
		for(DBObject product : productList){
			product.removeField("_id");
			Map<String, String> productMap = product.toMap();
			productMap.put("imageUrl", imageMap.get(category));
			productMapList.add(productMap);
		}		
			
			
			return productMapList;
	}

}
