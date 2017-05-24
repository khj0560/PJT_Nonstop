package com.nonstop.service.portfolio;

import java.util.List;
import java.util.Map;

import com.nonstop.domain.Portfolio;

public interface PortfolioDAO {

	public void addPortfolio(Portfolio portfolio) throws Exception;

	public Portfolio getPortfolio(int portNo) throws Exception;
	
	public List<Portfolio> getPortfolioList() throws Exception;
	
	public void updatePortfolio(Portfolio portfolio) throws Exception;
	
}
