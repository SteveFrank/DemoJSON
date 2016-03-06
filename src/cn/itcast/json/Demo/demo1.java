package cn.itcast.json.Demo;

import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.junit.Test;

/**
 * 演示JSON-LIB小工具
 * @author 杨谦
 * @date 2015-9-15 下午4:04:43
 *
 */
public class demo1 {
	@Test
	public void fun1(){
		JSONObject map = new JSONObject();
		map.put("name", "zhangsan");
		map.put("age", 23);
		map.put("sex", "male");
		
		System.out.println(map.toString());
	}
	
	@Test
	public void fun2(){
		Person p = new Person("LiSi",32,"female");
		JSONObject map = JSONObject.fromObject(p);
		System.out.println(map);
	}
	
	@Test
	public void fun3(){
		Person p1 = new Person("zhangsan",30,"male");
		Person p2 = new Person("LiSi",32,"female");
		
		JSONArray list = new JSONArray();
		list.add(p1);
		list.add(p2);
		
		System.out.println(list);
	}
	
	@Test
	public void fun4(){
		Person p1 = new Person("zhangsan",30,"male");
		Person p2 = new Person("LiSi",32,"female");
		
		List<Person> list = new ArrayList<Person>();
		list.add(p1);
		list.add(p2);
		
		System.out.println(JSONArray.fromObject(list).toString());
	}
}
