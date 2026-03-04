package com.project.mapper;

import java.util.List;

import com.project.domain.ChargeCoin;
import com.project.domain.Member;
import com.project.domain.PayCoin;

public interface CoinMapper {
	// 개인코인충전
	public int charge(ChargeCoin chargeCoin) throws Exception;
	// 충전내역등록
	public List<ChargeCoin> list(int userNo) throws Exception;
	// 충전내역리스트
	public int create(ChargeCoin chargeCoin) throws Exception;
	
	// 개인코인차감
	public int pay(PayCoin payCoin) throws Exception; 
	// 구매내역등록 
	public int createPayHistory(PayCoin payCoin) throws Exception; 
	// 구매내역등록리스트
	public List<PayCoin> listPayHistory(Member member) throws Exception; 
}
