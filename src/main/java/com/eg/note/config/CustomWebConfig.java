package com.eg.note.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class CustomWebConfig implements WebMvcConfigurer {
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/article/images/**")
                .addResourceLocations("file:" + "C:\\Users\\Administrator\\Desktop\\Note\\note_back\\src\\main\\resources\\static\\images\\");
    }
}
