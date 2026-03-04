package com.project.service;

import java.util.List;

import com.project.domain.ChargeCoin;
import com.project.domain.Member;
import com.project.domain.PayCoin;

public interface CoinService {

	public int charge(ChargeCoin chargeCoin) throws Exception;

	public List<ChargeCoin> list(int userNo) throws Exception;
	// 개인코인차감
	public int pay(PayCoin payCoin) throws Exception;
	// 구매내역등록
	public int createPayHistory(PayCoin payCoin) throws Exception;
	// 구매내역등록리스트
	public List<PayCoin> listPayHistory(Member member) throws Exception;

}
