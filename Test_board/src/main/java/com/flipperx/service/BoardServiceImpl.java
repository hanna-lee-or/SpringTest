package com.flipperx.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.flipperx.dao.BoardDAO;
import com.flipperx.domain.BoardVO;

@Service
public class BoardServiceImpl implements BoardService {

	@Inject
	private BoardDAO dao;

	@Override
	public void write(BoardVO vo) throws Exception {
		dao.write(vo);
	}

	@Override
	public void update(BoardVO vo) throws Exception {
		// TODO Auto-generated method stub
		dao.update(vo);
	}

	@Override
	public void delete(int bno) throws Exception {
		// TODO Auto-generated method stub
		dao.delete(bno);
	}

	@Override
	public BoardVO view(int bno) throws Exception {
		// TODO Auto-generated method stub
		return dao.view(bno);
	}

	@Override
	public List<BoardVO> list() throws Exception {
		// TODO Auto-generated method stub
		return dao.list();
	}

}
// 컨트롤러와 DAO를 연결해주는 역할.
// 비지니스 로직. (데이터를 사용할 수 있는 형태로 가공하는 작업)