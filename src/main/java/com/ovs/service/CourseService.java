package com.ovs.service;

import java.util.List;

import com.ovs.model.Course;

public interface CourseService {

	void saveCourse(Course course);

	List<Course> getAllCourse();

	Course getCourseById(Integer courseId);

	void deleteCourse(Integer courseId);

}
