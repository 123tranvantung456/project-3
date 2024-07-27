package edu.poly.test.config;
import org.sitemesh.builder.SiteMeshFilterBuilder;
import org.sitemesh.config.ConfigurableSiteMeshFilter;
import org.springframework.context.annotation.Configuration;

@Configuration
public class CustomSiteMeshFilter extends  ConfigurableSiteMeshFilter {
    @Override
    protected void applyCustomConfiguration(SiteMeshFilterBuilder builder) {
        // /decorators/web.jsp anh xa vao all link : /*
        builder
                .addDecoratorPath("/admin/*", "/decorators/admin.jsp");

    }
}
