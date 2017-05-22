package com.nonstop.service.portfolio.portfolioImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.nonstop.domain.Portfolio;
import com.nonstop.service.portfolio.PortfolioDAO;

@Repository("portfolioDAOImpl")
public class PortfolioDAOImpl  implements PortfolioDAO{

	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public PortfolioDAOImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public void addPortfolio(Portfolio portfolio) throws Exception {
		
		sqlSession.insert("PortfolioMapper.insertPortfolio", portfolio);
		
	}

	@Override
	public Portfolio getPortfolio(int portNo) throws Exception {

		return sqlSession.selectOne("PortfolioMapper.getPortfolio", portNo);
	}

	public List<Portfolio> getPortfolioList() throws Exception {
		return sqlSession.selectList("PortfolioMapper.getPortfolioList");
	}
	
}