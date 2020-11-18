package com.example.util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class ImageValidator {
    private static Pattern pattern;
    private static Matcher matcher;
    private static final String IMAGE__PATTERN = "([^\\s]+(\\.(?i)(jpg|png|gif|bmp))$)";

    static {
        pattern = Pattern.compile(IMAGE__PATTERN);
    }
//    public ImageValidator() {
//        pattern = Pattern.compile(IMAGE__PATTERN);
//    }

    public static boolean validate(final String image) {
        matcher = pattern.matcher(image);
        return matcher.matches();
    }
}
