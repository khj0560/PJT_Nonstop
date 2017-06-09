package com.nonstop.control.portfolio;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.nonstop.domain.Follow;
import com.nonstop.domain.PortComment;
import com.nonstop.domain.PortLike;
import com.nonstop.domain.Portfolio;
import com.nonstop.domain.Search;
import com.nonstop.domain.User;
import com.nonstop.service.portfolio.PortfolioService;
import com.nonstop.service.profile.ProfileService;
import com.nonstop.service.user.UserService;

@Controller
@RequestMapping("/portfolio/*")
public class PortfolioController {
	
	@Autowired
	@Qualifier("portfolioServiceImpl")
	private PortfolioService portfolioService;
	
	@Autowired
	@Qualifier("profileServiceImpl")
	private ProfileService profileService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	public PortfolioController() {

	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;

	@RequestMapping(value="addPortfolio", method=RequestMethod.GET)
	public String addPortfolio() throws Exception {
		
		return "forward:/view/portfolio/addPortfolioView.jsp";
	}
	
	@RequestMapping(value="addPortfolio", method=RequestMethod.POST)
	public String addPortfolio(@ModelAttribute("portfolio") Portfolio portfolio, @RequestParam("portFileName") MultipartFile file, Model model) throws Exception {
				
		String portFile=file.getOriginalFilename();
		
		System.out.println("portFile : "+portFile);
		
		portfolio.setPortFile(portFile);
		
		//user를 세션을 통해 받아와야 하는데 아직 로그인을 할 수 없으니 임시로 넣는다
		//나중에 수정할 부분이다!!
		portfolio.setPortUserId("user01");
		
		System.out.println("addPortfolio : "+portfolio);
		
        try {
            // 1. FileOutputStream 사용
            // FileOutputStream output = new FileOutputStream("C:/images/" + fileName);
             
            // 2. File 사용
            File uploadFile = new File("C:/Users/BitCamp/git/PJT_Nonstop/Nonstop/WebContent/resources/images/upload/" + portFile);
            file.transferTo(uploadFile);
            //문제1. images폴더에 파일이 업로드 되는 문제. 왜 upload 폴더로 안들어갈까
            //File uploadFile = new File("C:/Users/BitCamp/git/PJT_Nonstop/Nonstop/WebContent/resources/images/upload/" + portFile); 맨 뒤에 '/'를 붙여야 한다.
            //'/'를 붙이지 않으면 파일이름 앞에 upload가 붙는다.
        } catch (IOException e) {
            e.printStackTrace();
        }
	
		portfolioService.addPortfolio(portfolio);
		
		model.addAttribute("portfolio",portfolio);
		
		return "forward:/view/portfolio/getPortfolio.jsp";
	}
	
	@RequestMapping(value="listPortfolio")
	public String listPortfolio(@ModelAttribute("search") Search search, HttpSession session, Model model) throws Exception {
		
		//scrap 플래그 위한 session의 user정보
		String sessionUserId="testUser";
		
		if((User)session.getAttribute("user") != null) {
			sessionUserId = ((User)session.getAttribute("user")).getUserId();		
		}
		
		//16개씩 리스트 가져오기
		if(search.getEndRowNum() == 0) {
			search.setStartRowNum(1);
			search.setEndRowNum(16);
		}else{
			int startRowNum = search.getEndRowNum()+1;
			int endRowNum = startRowNum+16;

			search.setStartRowNum(startRowNum);
			search.setEndRowNum(endRowNum);
		}
		
		List<Portfolio> portfolioList = portfolioService.getPortfolioList(search, sessionUserId);
		
		//Portfolio Ranking 출력
		search.setStartRowNum(1);
		search.setEndRowNum(12);
		
		//search.postDivision의 맨 앞글자가 1이면 개발 전체, 2이면 디자인 전체로 세팅
		String postDivision = String.valueOf(search.getPostDivision());
		
		if(postDivision.startsWith("1")){
			search.setPostDivision(1);
		}else{
			search.setPostDivision(2);
		}
		//추천순으로 나열
		search.setPostSorting(3);
		
		List<Portfolio> portRanking = portfolioService.getPortfolioList(search, sessionUserId);

		model.addAttribute("list", portfolioList);
		model.addAttribute("ranking", portRanking);

		return "forward:/view/portfolio/listPortfolio.jsp";
	}
	
	//무한스크롤 용 listPortfolio. ajax로 요청이 들어오면 16개씩 list를 보내준다. Json타입으로 보내주기 위해 @ResponseBody사용
	@RequestMapping(value="listJsonPortfolio", method = RequestMethod.POST)
	@ResponseBody
	public List<Portfolio> listJsonPortfolio(@ModelAttribute("search") Search search, HttpSession session, Model model) throws Exception {
		
		String sessionUserId="testUser";
		
		if((User)session.getAttribute("user") != null) {
			sessionUserId = ((User)session.getAttribute("user")).getUserId();		
		}

		int startRowNum = search.getEndRowNum()+1;
		int endRowNum = startRowNum+15;

		search.setStartRowNum(startRowNum);
		search.setEndRowNum(endRowNum);

		List<Portfolio> portfolioList = portfolioService.getPortfolioList(search, sessionUserId);

		return portfolioList;
	}
	
	@RequestMapping(value="getPortfolio")
	public String getPortfolio(@RequestParam("portNo") int portNo, HttpSession session, Model model) throws Exception {
		
		System.out.println("getPortfolio Controller");
		
		String sessionUserId="testUser";
		
		if((User)session.getAttribute("user") != null) {
			sessionUserId = ((User)session.getAttribute("user")).getUserId();		
		}
		//스크랩, getPortfolio, 좋아요 플래그
		Portfolio portfolio = portfolioService.getPortfolio(portNo,sessionUserId);
		
		if(portfolio.getPortLikeNo()!=0){
			portfolio.setPortLikeFlag(true);
		}
		//댓글
		List<PortComment> portCommentList = portfolioService.getCommentList(portNo);
		//팔로우 플래그
		Follow follow = profileService.getFollow(sessionUserId, portfolio.getPortUserId());
		
		if(follow != null){
			portfolio.setPortFollowFlag(true);
		}
		
		//게시자 미니프로필용 user
		User user = userService.getUser(portfolio.getPortUserId());
		
		//클릭시 조회수 추가
		int portViewCount = portfolio.getTotalPortView();
		portfolio.setTotalPortView(++portViewCount);
		portfolio.setPortViewFlag(true);		
		portfolioService.updatePortCount(portfolio);
		
		//수정된 게시물의 경우 
		if(portfolio.getPortUpdate() != null){
			portfolio.setPortRegdate(portfolio.getPortUpdate());
		}
		
		//날짜계산
		String regdate = portfolio.getPortRegdate().toString();
		String portMonth = regdate.substring(5, 7);
		
		System.out.println(portMonth);
		
		switch(portMonth){
		
			case "01": portMonth = "January"; break;
			case "02": portMonth = "Febuary"; break;
			case "03": portMonth = "March"; break;
			case "04": portMonth = "April"; break;
			case "05": portMonth = "May"; break;
			case "06": portMonth = "June"; break;
			case "07": portMonth = "July"; break;
			case "08": portMonth = "August"; break;
			case "09": portMonth = "September"; break;
			case "10": portMonth = "October"; break;
			case "11": portMonth = "November"; break;
			case "12": portMonth = "December"; break;
		
		}
		
		portfolio.setPortYear(regdate.substring(0, 4));
		portfolio.setPortMonth(portMonth);
		portfolio.setPortDay(regdate.substring(8, 10));
		
		System.out.println("getPortfolio portfolio : "+portfolio);

		
		model.addAttribute("portCommentList", portCommentList);
		model.addAttribute("portfolio", portfolio);
		model.addAttribute("user", user);
		
		return "forward:/view/portfolio/getPortfolio.jsp";
	}

	@RequestMapping(value="updatePortfolio", method=RequestMethod.GET)
	public String updatePortfolio(@RequestParam("portNo") int portNo, Model model, HttpSession session) throws Exception {
		
		System.out.println("updatePortfolio Controller");
		
		String scrapUserId = ((User)session.getAttribute("user")).getUserId();
		
		Portfolio portfolio = portfolioService.getPortfolio(portNo,scrapUserId);
		
		System.out.println("getPortfolio portfolio : "+portfolio);
		
		model.addAttribute("portfolio", portfolio);
		
		return "forward:/view/portfolio/updatePortfolioView.jsp";
	}
	
	@RequestMapping(value="updatePortfolio", method=RequestMethod.POST)
	public String updatePortfolio(@ModelAttribute("portfolio") Portfolio portfolio, @RequestParam("portFileName") MultipartFile file, Model model) throws Exception {
				
		String portFile=file.getOriginalFilename();
		
		System.out.println("portFile : "+portFile);
		
		portfolio.setPortFile(portFile);
		
		//user를 세션을 통해 받아와야 하는데 아직 로그인을 할 수 없으니 임시로 넣는다
		//나중에 수정할 부분이다!!
		portfolio.setPortUserId("user01");
		
		//getPortfolio.jsp에서 hidden 태그로 숨겨서 가져와야햇!!! 나중에수정햇!!
		int portNo = 1;
		portfolio.setPortNo(portNo);
		
		System.out.println("addPortfolio : "+portfolio);
		
        try {
            // 1. FileOutputStream 사용
            // FileOutputStream output = new FileOutputStream("C:/images/" + fileName);
             
            // 2. File 사용
            File uploadFile = new File("C:/Users/BitCamp/git/PJT_Nonstop/Nonstop/WebContent/resources/images/upload/" + portFile);
            file.transferTo(uploadFile);
            //문제1. images폴더에 파일이 업로드 되는 문제. 왜 upload 폴더로 안들어갈까
            //문제2. 실제 파일 이름과 업로드되는 파일의 이름이 다르다. 앞에 upload가 붙는다. 그냥 붙여서 넣으면되네
        } catch (IOException e) {
            e.printStackTrace();
        }
	
		portfolioService.updatePortfolio(portfolio);
		
		model.addAttribute("portfolio",portfolio);
		
		return "forward:/view/portfolio/getPortfolio.jsp";
	}
	
	@RequestMapping(value="deletePortfolio")
	public String deletePortfolio(@RequestParam("portNo") int portNo) throws Exception {
		
		portfolioService.deletePortfolio(portNo);
		
		return "forward:/index.jsp";
	}
	
	@RequestMapping(value={"addJsonComment"}, method=RequestMethod.POST)
	public void addJsonComment( @ModelAttribute("portComment") PortComment portComment, HttpSession session, Model model ) throws Exception {
		
		System.out.println("/addJsonComment");
		
		System.out.println("portComment : "+portComment);
		
		portfolioService.addComment(portComment);
		
		portComment = portfolioService.getComment(portComment.getComNo());
		
		model.addAttribute("portComment", portComment);
	}
	
	@RequestMapping(value="deleteComment/{comNo}/{comPortNo}" , method=RequestMethod.GET)
	public void deleteComment(@PathVariable("comNo") int comNo, @PathVariable("comPortNo") int comPortNo, Model model) throws Exception{
		
		portfolioService.deleteComment(comNo);
		
	}
	
	@RequestMapping(value="addJsonPortLike" , method=RequestMethod.POST)
	public void addJsonPortLike(@ModelAttribute("portLike") PortLike portLike) throws Exception{
		
		System.out.println("/portfolio/addJsonPortLike");
		
		Portfolio portfolio = portfolioService.getPortfolio(portLike.getPortNo(), portLike.getUserId());
		//클릭시 추천수 추가
		portfolio.setTotalPortLike(portfolio.getTotalPortLike()+1);
		portfolio.setPortLikeFlag(true);
		portfolioService.updatePortCount(portfolio);
		
		portfolioService.addPortLike(portLike);
		
	}
	
	@RequestMapping(value="delJsonPortLike" , method=RequestMethod.POST)
	public void delJsonPortLike(@ModelAttribute("portLike") PortLike portLike) throws Exception{
		
		System.out.println("/portfolio/delJsonPortLike");
	
		Portfolio portfolio = portfolioService.getPortfolio(portLike.getPortNo(), portLike.getUserId());
		
		System.out.println("djfjowiejfojofgmkfl : "+portfolio.getTotalPortLike());
		
		//클릭시 추천수 감소
		portfolio.setTotalPortLike(portfolio.getTotalPortLike()-1);
		portfolio.setPortLikeFlag(true);
		portfolioService.updatePortCount(portfolio);
		
		portfolioService.deletePortLike(portLike.getPortLikeNo());
		
	}

}
