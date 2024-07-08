package com.audiro.web;

import static com.audiro.filter.AuthenticationFilter.SESSION_ATTR_USER;

import java.io.IOException;
import java.net.URLEncoder;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.audiro.dto.UserCreateDto;
import com.audiro.dto.UserSignInDto;
import com.audiro.repository.User;
import com.audiro.service.UserService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Controller
@RequestMapping("/user")
public class UserController {
    
    private final UserService userService;
    
    @GetMapping("/signup") // GET 방식의 /user/signup 요청을 처리하는 컨트롤러 메서드 
    public void signUp() {
        log.debug("GET signUp()");
    }
    
    @PostMapping("/signup") // POST 방식의 /user/signup 요청을 처리하는 컨트롤러 메서드
    public String signUp(UserCreateDto dto) {
        log.debug("POST signUp({})", dto);
        
        userService.create(dto);
        
        return "redirect:/user/signin"; // 로그인 페이지로 이동.
    }
    
    // 사용자 아이디 중복체크 REST 컨트롤러
    @GetMapping("/checkid")
    @ResponseBody // 메서드 리턴 값이 클라이언트로 전달되는 데이터.
    public ResponseEntity<String> checkId(@RequestParam(name = "id") String id) {
        log.debug("checkId(id={})", id);
        
        boolean result = userService.checkId(id);
        if (result) {
            return ResponseEntity.ok("Y");
        } else {
            return ResponseEntity.ok("N");
        }
    }

    @GetMapping("/signin")
    public void signIn() {
        log.debug("GET signIn()");
    }
    
    @PostMapping("/signin")
    public String signIn(UserSignInDto dto, 
            @RequestParam(name = "target", defaultValue = "") String target,
            HttpSession session) throws IOException {
        log.debug("POST signIn({})", dto);
        
        User user = userService.read(dto);
        String targetPage = "";
        if (user != null) { // 아이디와 비밀번호가 일치하는 사용자 있는 경우
        	log.debug("(user != null): {}",user.getId());
            // 세션에 로그인 사용자 아이디를 저장
            session.setAttribute(SESSION_ATTR_USER, user.getId());
            
            // 로그인 성공 후 이동할 타겟 페이지
            targetPage = (target.equals("")) ? "/" : target;
            
        } else { // 아이디와 비밀번호가 일치하는 사용자 없는 경우
            targetPage = "/user/signin?result=f&target="
                    + URLEncoder.encode(target, "UTF-8");
        }
        
        return "redirect:" + targetPage;
    }
    
    @GetMapping("/signout")
    public String signOut(HttpSession session) {
        log.debug("singOut()");
        
        session.removeAttribute(SESSION_ATTR_USER);
        session.invalidate();
        
        return "redirect:/user/signin";
    }
    
}
