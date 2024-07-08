package com.audiro.web;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.audiro.dto.CommunityPostListDto;
import com.audiro.dto.CommunityPostSearchDto;
import com.audiro.dto.CommunityRankingDto;

import com.audiro.service.CommunityService;


import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor //-> final 필드들을 초기화하는 생성자.의존성 주입
@Controller
@RequestMapping("/community")
public class CommunityController {
	
	//의존성 주입
	private final CommunityService communityService;
	
	@GetMapping("/main")
	public void main(Model model) {
		log.debug("main()");
		//랭킹
		//관심유저(찜많은) 순위 3명 select
		List<CommunityRankingDto> userLikeTop3List = communityService.readRankingLikeUserTop3();
		log.debug("userLikeTop3List:{}",userLikeTop3List);
		model.addAttribute("userLikeTop3List", userLikeTop3List); //main.jsp로 보냄 ${}써서 사용가능
		
		//good많은 post 순위 3(여행후기 제외) select
		List<CommunityRankingDto> postGoodTop3List = communityService.readRankingAllPostsGoodTop3();
		log.debug("postGoodTop3List:{}", postGoodTop3List);
		model.addAttribute("postGoodTop3List", postGoodTop3List);
		
		//댓글 많이 단 user 순위 3(여행후기 제외) select
		List<CommunityRankingDto> commentsUserTop3 = communityService.readRankingCommentsUserTop3();
		log.debug("commentsUserTop3:{}",commentsUserTop3);
		model.addAttribute("commentsUserTop3", commentsUserTop3);		
		
	}
	
	@GetMapping("/details")
	public void details(@RequestParam(name = "postId") int postId, Model model) {
		log.debug("details(postId:{})",postId);
		
		CommunityPostListDto post = communityService.readByPostIdDetails(postId);
		log.debug(post.toString());
		model.addAttribute("p", post);
		
		//랭킹
		//관심유저(찜많은) 순위 3명 select
		List<CommunityRankingDto> userLikeTop3List = communityService.readRankingLikeUserTop3();
		log.debug("userLikeTop3List:{}",userLikeTop3List);
		model.addAttribute("userLikeTop3List", userLikeTop3List); //main.jsp로 보냄 ${}써서 사용가능
		
		//good많은 post 순위 3(여행후기 제외) select
		List<CommunityRankingDto> postGoodTop3List = communityService.readRankingAllPostsGoodTop3();
		log.debug("postGoodTop3List:{}", postGoodTop3List);
		model.addAttribute("postGoodTop3List", postGoodTop3List);
		
		//댓글 많이 단 user 순위 3(여행후기 제외) select
		List<CommunityRankingDto> commentsUserTop3 = communityService.readRankingCommentsUserTop3();
		log.debug("commentsUserTop3:{}",commentsUserTop3);
		model.addAttribute("commentsUserTop3", commentsUserTop3);
	}
	
	
	@GetMapping("/create")
	public void create(Model model) {
		log.debug("create()");
		
		//랭킹
		//관심유저(찜많은) 순위 3명 select
		List<CommunityRankingDto> userLikeTop3List = communityService.readRankingLikeUserTop3();
		log.debug("userLikeTop3List:{}",userLikeTop3List);
		model.addAttribute("userLikeTop3List", userLikeTop3List); //main.jsp로 보냄 ${}써서 사용가능
		
		//good많은 post 순위 3(여행후기 제외) select
		List<CommunityRankingDto> postGoodTop3List = communityService.readRankingAllPostsGoodTop3();
		log.debug("postGoodTop3List:{}", postGoodTop3List);
		model.addAttribute("postGoodTop3List", postGoodTop3List);
		
		//댓글 많이 단 user 순위 3(여행후기 제외) select
		List<CommunityRankingDto> commentsUserTop3 = communityService.readRankingCommentsUserTop3();
		log.debug("commentsUserTop3:{}",commentsUserTop3);
		model.addAttribute("commentsUserTop3", commentsUserTop3);
	}
	
	
	@GetMapping("/test")
	public void test(Model model) {
		log.debug("create()");
		
		//랭킹
		//관심유저(찜많은) 순위 3명 select
		List<CommunityRankingDto> userLikeTop3List = communityService.readRankingLikeUserTop3();
		log.debug("userLikeTop3List:{}",userLikeTop3List);
		model.addAttribute("userLikeTop3List", userLikeTop3List); //main.jsp로 보냄 ${}써서 사용가능
		
		//good많은 post 순위 3(여행후기 제외) select
		List<CommunityRankingDto> postGoodTop3List = communityService.readRankingAllPostsGoodTop3();
		log.debug("postGoodTop3List:{}", postGoodTop3List);
		model.addAttribute("postGoodTop3List", postGoodTop3List);
		
		//댓글 많이 단 user 순위 3(여행후기 제외) select
		List<CommunityRankingDto> commentsUserTop3 = communityService.readRankingCommentsUserTop3();
		log.debug("commentsUserTop3:{}",commentsUserTop3);
		model.addAttribute("commentsUserTop3", commentsUserTop3);
	}	
	
	@PostMapping("/test")
	@ResponseBody //-> rest컨트롤러 리턴값은 뷰의 이름이 아니라 클라이언트로 직접 보내는 데이터(자바스트립트에서 받아서 사용)
	public void test2(Model model) {
		log.debug("create()");
		//TODO : usersId/postTypeId/title/content 채워서 자바스크립트(에이작스)로 데이터 전달하기
		
		
		//랭킹
		//관심유저(찜많은) 순위 3명 select
		List<CommunityRankingDto> userLikeTop3List = communityService.readRankingLikeUserTop3();
		log.debug("userLikeTop3List:{}",userLikeTop3List);
		model.addAttribute("userLikeTop3List", userLikeTop3List); //main.jsp로 보냄 ${}써서 사용가능
		
		//good많은 post 순위 3(여행후기 제외) select
		List<CommunityRankingDto> postGoodTop3List = communityService.readRankingAllPostsGoodTop3();
		log.debug("postGoodTop3List:{}", postGoodTop3List);
		model.addAttribute("postGoodTop3List", postGoodTop3List);
		
		//댓글 많이 단 user 순위 3(여행후기 제외) select
		List<CommunityRankingDto> commentsUserTop3 = communityService.readRankingCommentsUserTop3();
		log.debug("commentsUserTop3:{}",commentsUserTop3);
		model.addAttribute("commentsUserTop3", commentsUserTop3);
		
	
	}
	
//	//TODO : main test ------------------------------------------------시작
//	@GetMapping("/maintest")
//	public void maintest(Model model) {
//		log.debug("maintest()");
//		//전체 게시판 최신순/인기순
//		List<CommunityPostListDto> allListNew = communityService.readEntirePostCreateTimeDesc();
//		log.debug(allListNew.toString());
//		List<CommunityPostListDto> allListGood = communityService.readEntirePostGoodDesc();
//		log.debug(allListGood.toString());
//		//여행 메이트 게시판 최신순/인기순
//		List<CommunityPostListDto> mateListNew = communityService.readMatePostCreateTimeDesc();
//		log.debug(mateListNew.toString());
//		List<CommunityPostListDto> mateListGood = communityService.readMatePostGoodDesc();
//		log.debug(mateListGood.toString());
//		//자유 게시판 최신순/인기순
//		List<CommunityPostListDto> freeListNew = communityService.readFreePostCreateTimeDesc();
//		log.debug(freeListNew.toString());
//		List<CommunityPostListDto> freeListGood = communityService.readFreePostGoodDesc();
//		log.debug(freeListGood.toString());
//		
//		model.addAttribute("allListNew",allListNew);
//		model.addAttribute("allListGood",allListGood);
//		model.addAttribute("mateListNew",mateListNew);
//		model.addAttribute("mateListGood",mateListGood);
//		model.addAttribute("freeListNew",freeListNew);
//		model.addAttribute("freeListGood",freeListGood);
//		
//		
//	}
//	
//	
//	@GetMapping("/maintest3")
//	public void maintest3(Model model) {
//		log.debug("maintest3()");
//		//전체 게시판 최신순/인기순
//		List<CommunityPostListDto> allListNew = communityService.readEntirePostCreateTimeDesc();
//		log.debug(allListNew.toString());
//		List<CommunityPostListDto> allListGood = communityService.readEntirePostGoodDesc();
//		log.debug(allListGood.toString());
//		//여행 메이트 게시판 최신순/인기순
//		List<CommunityPostListDto> mateListNew = communityService.readMatePostCreateTimeDesc();
//		log.debug(mateListNew.toString());
//		List<CommunityPostListDto> mateListGood = communityService.readMatePostGoodDesc();
//		log.debug(mateListGood.toString());
//		//자유 게시판 최신순/인기순
//		List<CommunityPostListDto> freeListNew = communityService.readFreePostCreateTimeDesc();
//		log.debug(freeListNew.toString());
//		List<CommunityPostListDto> freeListGood = communityService.readFreePostGoodDesc();
//		log.debug(freeListGood.toString());
//		
//		model.addAttribute("allListNew",allListNew);
//		model.addAttribute("allListGood",allListGood);
//		model.addAttribute("mateListNew",mateListNew);
//		model.addAttribute("mateListGood",mateListGood);
//		model.addAttribute("freeListNew",freeListNew);
//		model.addAttribute("freeListGood",freeListGood);
//		
//		//랭킹
//		//관심유저(찜많은) 순위 3명 select
//		List<CommunityRankingDto> userLikeTop3List = communityService.readRankingLikeUserTop3();
//		model.addAttribute("userLikeTop3List", userLikeTop3List);
//		
//		
//	}
//	//main test ------------------------------------------------끝
//	
//	//검색
//	//검색 최신순
//    @GetMapping("/search")
//    public String search(CommunityPostSearchDto dto, Model model) {
//        log.debug("search({})", dto);
//        
//        List<CommunityPostListDto> list = communityService.searchIdDesc(dto);
//        model.addAttribute("searchOrderByIdDescList", list);
//        
//        //-----------------------
//		log.debug("/search/maintest3()");
//		//전체 게시판 최신순/인기순
//		List<CommunityPostListDto> allListNew = communityService.readEntirePostCreateTimeDesc();
//		log.debug(allListNew.toString());
//		List<CommunityPostListDto> allListGood = communityService.readEntirePostGoodDesc();
//		log.debug(allListGood.toString());
//		//여행 메이트 게시판 최신순/인기순
//		List<CommunityPostListDto> mateListNew = communityService.readMatePostCreateTimeDesc();
//		log.debug(mateListNew.toString());
//		List<CommunityPostListDto> mateListGood = communityService.readMatePostGoodDesc();
//		log.debug(mateListGood.toString());
//		//자유 게시판 최신순/인기순
//		List<CommunityPostListDto> freeListNew = communityService.readFreePostCreateTimeDesc();
//		log.debug(freeListNew.toString());
//		List<CommunityPostListDto> freeListGood = communityService.readFreePostGoodDesc();
//		log.debug(freeListGood.toString());
//		
//		model.addAttribute("allListNew",allListNew);
//		model.addAttribute("allListGood",allListGood);
//		model.addAttribute("mateListNew",mateListNew);
//		model.addAttribute("mateListGood",mateListGood);
//		model.addAttribute("freeListNew",freeListNew);
//		model.addAttribute("freeListGood",freeListGood);
//		
//		//랭킹
//		//관심유저(찜많은) 순위 3명 select
//		List<CommunityRankingDto> userLikeTop3List = communityService.readRankingLikeUserTop3();
//		model.addAttribute("userLikeTop3List", userLikeTop3List);
//        //------------------
//        
//        return "community/maintest3";
//    }
    
    
//    @RequestMapping("/main/page/{pageNumber}")
//    public String getPagedPosts(@PathVariable("pageNumber") int pageNumber, Model model) {
//        log.debug("getPagedPosts()");
//        log.debug("pageNumber: {}", pageNumber);
//
//        int pageSize = 20; // 한 페이지당 게시물 수
//        List<Post> allListNew = communityService.getPagedNewAllPosts(pageNumber, pageSize); // 서비스 클래스를 호출하여 데이터를 가져옵니다
//        log.debug("allListNew: {}", allListNew);
//
//        int totalPosts = communityService.getTotalPostCount(); // 총 게시물 수를 가져옵니다
//        log.debug("totalPosts: {}", totalPosts);
//
//        // 모델에 데이터를 추가합니다.
//        model.addAttribute("allListNew", allListNew); // 현재 페이지의 게시물 리스트
//        model.addAttribute("currentPage", pageNumber); // 현재 페이지 번호
//        model.addAttribute("totalPages", (int) Math.ceil((double) totalPosts / pageSize)); // 총 페이지 수 계산
//
//        return "community/main"; // community/main.jsp 파일로 이동합니다
//    }
	
	
}//컨트롤러 클레스 끝