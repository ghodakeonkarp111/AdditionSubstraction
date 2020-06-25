package com.maven.tests;

import static org.junit.Assert.*;

import org.junit.Test;

public class JenkinsCalcTest {

	@Test
	public void addTest() {
		JenkinsCalculator jenkinsCalculator=new JenkinsCalculator();
		assertEquals(10,jenkinsCalculator.addNumbers(5, 5));
	}
	@Test
	public void substractTest() {
		JenkinsCalculator jenkinsCalculator=new JenkinsCalculator();
		assertEquals(0,jenkinsCalculator.substractNumbers(5, 5));
	}

}
