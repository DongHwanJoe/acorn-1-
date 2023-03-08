
package com.gura.acorn;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.scheduling.annotation.EnableScheduling;

import com.gura.acorn.websocket.WebSocketService;


@SpringBootApplication
@EnableScheduling
public class AcornApplication extends SpringBootServletInitializer {
	
	// 이 부분 추가
		@Override
		protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
			return builder.sources(AcornApplication.class);
		}
	
	public static void main(String[] args) {
		ConfigurableApplicationContext context = SpringApplication.run(AcornApplication.class, args);
		//웹소켓 서비스를 bean으로 만든다.
		WebSocketService webSocketService = context.getBean(WebSocketService.class);
	}
	
}
