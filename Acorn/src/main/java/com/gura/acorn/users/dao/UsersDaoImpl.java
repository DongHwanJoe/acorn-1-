package com.gura.acorn.users.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gura.acorn.users.dto.UsersDto;

@Repository
public class UsersDaoImpl implements UsersDao{
	
	@Autowired
	private SqlSession session;
	
	//해당 아이디가 존재하는지 여부를 리턴하는 메소드 
	@Override
	public boolean isExist(String inputId) {
		//id 를 이용해서 select 해보면  null 혹은 null 이 아니다.
		UsersDto dto=session.selectOne("users.getData", inputId);
		//아이디 존재 여부를 알아내서 
		boolean isExist = dto==null ? false : true;
		//리턴해준다.
		return isExist;
	}

	@Override
	public void insert(UsersDto dto) {
		session.insert("users.insert", dto);
	}

	@Override
	public UsersDto getData(String id) {
		UsersDto dto=session.selectOne("users.getData", id);
		return dto;
	}
	
	//비밀번호 수정
	@Override
	public void updatePwd(UsersDto dto) {
		session.update("users.updatePwd", dto);
	}
	
	//이메일과 프로필 수정
	@Override
	public void update(UsersDto dto) {
		session.update("users.update", dto);
	}
	
	//아이디를 이용한 삭제
	@Override
	public void delete(String id) {
		session.delete("users.delete", id);
	}

	@Override
	public List<UsersDto> getList(UsersDto dto) {
		return session.selectList("users.getList", dto);
	}
	
	@Override
	public List<UsersDto> getList2(UsersDto dto) {
		
		return session.selectList("users.getList2", dto);
	}

	@Override
	public int getCount(UsersDto dto) {
		return session.selectOne("users.getCount", dto);
	}

	@Override
	public UsersDto getData(int num) {
		return session.selectOne("users.getData", num);
	}

	@Override
	public UsersDto getData(UsersDto dto) {
		return session.selectOne("users.getData2", dto);
	}

	@Override
	public void ban(String id) {
		session.update("users.ban", id);
	}
}