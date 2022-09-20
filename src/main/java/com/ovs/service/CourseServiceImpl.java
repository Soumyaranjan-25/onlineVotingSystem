package com.ovs.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ovs.model.Course;
import com.ovs.repository.CourseRepository;

@Service
public class CourseServiceImpl implements CourseService {
	@Autowired
	private CourseRepository courseRepository;
	@Override
	public void saveCourse(Course course) {
		Date today=new Date();
		if(course.getCourseId()==null) {
			course.setCreatedOn(today);
			course.setCreatedBy(1);
		}
		else {
			course.setUpdatedOn(today);
			course.setUpdatedBy(1);
		}
		course.setBitstatus("false");
		courseRepository.save(course);
	}
	@Override
	public List<Course> getAllCourse() {
		return courseRepository.getAllCourse();
	}
	@Override
	public Course getCourseById(Integer courseId) {
		return courseRepository.getCourseById(courseId);
	}
	@Override
	public void deleteCourse(Integer courseId) {
		courseRepository.deleteCourse(courseId);		
	}

}
