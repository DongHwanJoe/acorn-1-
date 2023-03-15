package com.gura.acorn.shop.dao;

import java.util.List;

import com.gura.acorn.shop.dto.ShopDto;

public interface ShopDao {
	   //음식점 목록
	   public List<ShopDto> getList(ShopDto dto);
	   //평점이 높은 음식점 리스트
	   public List<ShopDto> getTopList(ShopDto dto);
	   //음식점의 갯수
	   public int getCount(ShopDto dto);
	   //음식점 추가
	   public void insert(ShopDto dto);
	   //음식점 삭제
	   public void delete(int num);
	   //음식점 수정
	   public void update(ShopDto dto);
	   //음식점 정보 얻어오기
	   public ShopDto getData(int num);
	   //키워드를 활용하여 음식점 정보 얻어오기
	   public ShopDto getData(ShopDto dto);
	   //음식점 조회수 증가시키기
	   public void addViewCount(int num);
}
