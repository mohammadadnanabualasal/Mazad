package com.example.mazad;


import com.example.mazad.entities.AdsEntity;
import com.example.mazad.entities.ItemEntity;
import com.example.mazad.login.LoginBean;
import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.i18n.CookieLocaleResolver;
import org.springframework.web.servlet.i18n.LocaleChangeInterceptor;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import java.util.Locale;

@Configuration
@EnableScheduling
public class AppConfiguration implements WebMvcConfigurer {

    @Bean
    public static MessageSource messageSource() {
        ReloadableResourceBundleMessageSource messageSource
                = new ReloadableResourceBundleMessageSource();
        messageSource.setBasenames("classpath:/messages/messages");
        messageSource.setDefaultEncoding("UTF-8");
        return messageSource;
    }

    @Bean(name = "localeResolver")
    public LocaleResolver getLocaleResolver()  {
        SessionLocaleResolver resolver= new SessionLocaleResolver();
        resolver.setDefaultLocale(Locale.US);

        return resolver;
    }

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(localeChangeInterceptor());
    }

    @Bean
    public LocaleChangeInterceptor localeChangeInterceptor() {
        LocaleChangeInterceptor localeChangeInterceptor = new LocaleChangeInterceptor();
        localeChangeInterceptor.setParamName("lang");
        return localeChangeInterceptor;
    }


    @Bean
    public LoginBean loginBean()
    {
        LoginBean loginBean = new LoginBean();
        return  loginBean;
    }

    @Scheduled(fixedDelay = 10000)
    public void checkActiveAds()
    {

        for (AdsEntity add: AdsEntity.getAllAds()
             ) {

            if (add.endIn().equals("This AD has finished.")){
                //charge the user the price of the product
                //send email to the seller and the buyer to inform them.
                //send notification to the seller and the buyer to inform them.
                //delete the add.
                AdsEntity.deleteAd(add.getId()+"");
                ItemEntity.getEntityByAdId(add.getTypeId(), add.getId()).deleteEntity();
            }
        }
    }
}