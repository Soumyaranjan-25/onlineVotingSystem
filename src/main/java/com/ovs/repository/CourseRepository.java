package com.ovs.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.ovs.model.Course;
@Repository
public interface CourseRepository extends JpaRepository<Course, Integer> {
	@Query("From Course where courseId=:courseId")
	Course getCourseById(Integer courseId);
	
	@Transactional
	@Modifying
	@Query("Update Course set bitstatus='true' where courseId=:courseId")
	void deleteCourse(Integer  courseId);
	@Query("From Course where bitstatus='false'")
	List<Course> getAllCourse();

}
