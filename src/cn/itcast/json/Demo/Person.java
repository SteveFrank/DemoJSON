package cn.itcast.json.Demo;

public class Person {
	private String username;
	private int age;
	private String sex;
	
	public Person() {
		super();
	}
	
	public Person(String username, int age, String sex) {
		super();
		this.username = username;
		this.age = age;
		this.sex = sex;
	}
	
	public String getUsername() {
		return username;
	}
	
	public void setUsername(String username) {
		this.username = username;
	}
	
	public int getAge() {
		return age;
	}
	
	public void setAge(int age) {
		this.age = age;
	}
	
	public String getSex() {
		return sex;
	}
	
	public void setSex(String sex) {
		this.sex = sex;
	}
}
