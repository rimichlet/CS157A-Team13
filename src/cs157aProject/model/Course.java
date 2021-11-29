package cs157aProject.model;

public class Course {

	private int courseID;
	private String course_name;
	
	public Course(int courseID, String course_name) {
		super();
		this.courseID = courseID;
		this.course_name = course_name;
	}
	public int getCourseID() {
		return courseID;
	}
	public void setCourseID(int courseID) {
		this.courseID = courseID;
	}
	public String getCourse_name() {
		return course_name;
	}
	public void setCourse_name(String course_name) {
		this.course_name = course_name;
	}
	
	
}
