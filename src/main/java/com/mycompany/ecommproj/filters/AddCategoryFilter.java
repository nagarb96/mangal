package com.mycompany.ecommproj.filters;

import com.mycompany.ecommproj.model.User;
import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

@WebFilter(urlPatterns = "/AddCategory.jsp")
public class AddCategoryFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        System.out.println("AddCategory Init");
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        
        HttpServletRequest req = (HttpServletRequest)request;
        System.out.println("FILTER ROLE:");
        System.out.println( ((User)req.getSession().getAttribute("currUser")).getRole() );
        if(req.getSession().getAttribute("currUser") == null){
            throw new javax.ws.rs.ForbiddenException();
        }else if(!((User)req.getSession().getAttribute("currUser")).getRole().equals("ROLE_ADMIN") ){
            throw new javax.ws.rs.ForbiddenException();
        } else {
            chain.doFilter(request, response);
        }
        
    }

    @Override
    public void destroy() {
        System.out.println("AddCategory Dest");
    }

}
