package com.flipperx.ddive;

import java.sql.Connection;
import java.sql.DriverManager;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.flipperx.domain.BoardVO;
import com.flipperx.service.BoardService;

//
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/root-context.xml" })
public class DBConnect {

	final String DRIVER = "org.mariadb.jdbc.Driver";
	final String URL = "jdbc:mariadb://127.0.0.1:3307";
	final String USER = "flipperx";
	final String PASSWORD = "dive1886";

	@Test
	public void connectionTest() throws Exception {

		Class.forName(DRIVER);

		try {
			Connection con = DriverManager.getConnection(URL, USER, PASSWORD);
			System.out.println(con);

		} catch (Exception e) {
			e.printStackTrace();
		}
	} // connectionTest end

	@Inject
	private BoardService service;

	@Test
	public void writeTest() throws Exception {
		BoardVO vo = new BoardVO();

		vo.setTitle("클릭");
		vo.setContent("Hello World!");
		vo.setWriter("ㅇㅁㅇ!");

		service.write(vo);
	}
	
	@Test
	public void updateTest() throws Exception {
		BoardVO vo = new BoardVO();

		vo.setBoardNum(5);
		vo.setTitle("클릭클릭");
		vo.setContent("수정 테스트");
		vo.setWriter("지우개");

		service.update(vo);
	}

	@Test
	public void deleteTest() throws Exception {
		BoardVO vo = new BoardVO();

		vo.setBoardNum(6);

		service.delete(vo.getBoardNum());
	}

	
}