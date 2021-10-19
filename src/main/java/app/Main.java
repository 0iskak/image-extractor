package app;

import lombok.extern.slf4j.Slf4j;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Element;
import spark.ModelAndView;
import spark.template.freemarker.FreeMarkerEngine;

import java.util.ArrayList;
import java.util.HashMap;

import static spark.Spark.*;

@Slf4j
public class Main {
    private static String render(HashMap<String, Object> model, String path) {
        return new FreeMarkerEngine().render(new ModelAndView(model, path));
    }

    public static void main(String[] args) {
        port(1000);
        staticFiles.location("/");

        get("/", (req, res) -> {
            var model = new HashMap<String, Object>();

            return render(model, "home.ftlh");
        });

        post("/", (req, res) -> {
            var model = checkURL(req.queryParams("URL").toLowerCase());

            return render(model, "home.ftlh");
        });
    }

    private static HashMap<String, Object> checkURL(String val) {
        var model = new HashMap<String, Object>();

        // https://example.org/ -> https://example.org
        if (val.charAt(val.length()-1) == '/')
            val = val.substring(0, val.length()-1);
        model.put("URL", val);

        try {
            // Jsoup
            var doc = Jsoup.connect(val).get();
            // add with <img> tag
            var elements = doc.select("img");
            // with <svg> tag
            elements.addAll(doc.select("svg"));

            // if no images found
            if (elements.size() == 0)
                throw new Exception();

            // add imgs to model
            var files = new ArrayList<String>();
            var embedded = new ArrayList<String>();
            for (Element e : elements) {
                // get src from <img> tag
                if (e.tagName().equals("img")) {
                    String src = e.attr("src");
                    // /img/1.png -> https://example.org/img/1.png
                    if (src.charAt(0) == '/')
                        src = val+src;

                    if (src.charAt(0) == 'h')
                        files.add(src);
                } else {
                    embedded.add(e.toString());
                }
            }
            model.put("files", files);
            model.put("embedded", embedded);

            // No error
            model.put("error", false);
        } catch (Exception e) {
            // Error
            model.put("error", true);

            // example.org -> https://example.org and repeats
            if (val.charAt(0) != 'h')
                model = checkURL("https://"+val);
        }

        return model;
    }
}
