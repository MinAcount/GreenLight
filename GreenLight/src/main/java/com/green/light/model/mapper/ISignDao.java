package com.green.light.model.mapper;


import java.util.List;
import java.util.Map;

import com.green.light.vo.SignVo;


public interface ISignDao {
	


	public List<SignVo> selectAllSign();
	
	public int insertSign(SignVo signVo);
	
	
	
/*  근속연수 1이 되지 않는 사람은 1달 만근시 1일 연차가 부여되는 cron 을 만듦
 * 	근속연수 1년 시점에 15일 연차휴가 부여 cron
 * 	입사일자가 정배임 우린 입사일 기준이다! 그렇다면 한달은 어떻게 할거지?
 * 	
 * 
 */
	


}
