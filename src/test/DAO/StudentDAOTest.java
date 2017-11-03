package test.DAO; 

import DAO.StudentDAO;
import org.junit.Test;
import org.junit.Before;
import org.junit.After;


/**
* StudentDAO Tester. 
* 
* @author <Authors name> 
* @since <pre>ʮһ�� 3, 2017</pre> 
* @version 1.0 
*/ 
public class StudentDAOTest { 

@Before
public void before() throws Exception { 
} 

@After
public void after() throws Exception { 
} 

/** 
* 
* Method: search(String id, String password) 
* 
*/ 
@Test
public void testSearch() throws Exception { 
//TODO: Test goes here... 
} 

/** 
* 
* Method: getAll() 
* 
*/ 
@Test
public void testGetAll() throws Exception { 
//TODO: Test goes here... 
} 

/** 
* 
* Method: deleteStudent(String studentID) 
* 
*/ 
@Test
public void testDeleteStudent() throws Exception { 
//TODO: Test goes here... 
} 

/** 
* 
* Method: insertStudent(String studentID, String studentName, String className, boolean sex, String birth, String nation, String entrance, String specialty) 
* 
*/ 
@Test
public void testInsertStudent() throws Exception { 
//TODO: Test goes here... 
} 

/** 
* 
* Method: updateStudent(String studentID, String studentName, String className, boolean sex, String birth, String nation, String entrance, String specialty) 
* 
*/ 
@Test
public void testUpdateStudent() throws Exception {
    StudentDAO.updateStudent("0049","1","1",true,"0","a","a","c");
}

/** 
* 
* Method: updatePwd(String studentID, String password, String newPassword) 
* 
*/ 
@Test
public void testUpdatePwd() throws Exception { 
//TODO: Test goes here... 
} 


} 
