package com.example;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Scanner;


public class Test {
    private String stringUrl;
    private String name;
    private final String CHECK_URL = "^(https?:\\/\\/)?([\\w\\.]+)\\.([a-z]{2,6}\\.?)(\\/[\\w\\.]*)*\\/?$";

    public Test() {
        name = "./my_binary";
    }

    public void healthchecker() {
        Scanner scanner = new Scanner(System.in);
        String inputStr = scanner.nextLine();
        String[] strings = inputStr.trim().split(" +");
        long seconds;
        if (!(strings[0].equals(name))) {
            System.out.println("parsing error\n```");
            return;
        }

        if (!(strings[1].matches("[0-9]+"))) {
            System.out.println("Second parsing error\n```");
            return;
        } else {
            seconds = Long.valueOf(strings[1]);
        }

        if (!(strings[2].matches(CHECK_URL))) {
            System.out.println("Url parsing error\n```");
            return;
        } else {
            stringUrl = strings[2];
        }
        for (int i = 0; i < 3; i++) {
            try {
                final URL url = new URL(stringUrl);
                final HttpURLConnection con = (HttpURLConnection) url.openConnection();
                System.out.print("Checking '" + url + "'. ");
                int responseCode = con.getResponseCode();
                if (responseCode == HttpURLConnection.HTTP_OK) {
                    System.out.println("Result: OK(" + responseCode + ")");
                } else {
                    System.out.println("Result: ERR(" + responseCode + ")");
                }
                try {
                    Thread.sleep(seconds * 1000);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
                if (i == 2) {
                    System.out.print("^C\n" +
                            "```\n" +
                            "```");
                }

            } catch (IOException e) {
                e.printStackTrace();
            }

        }

    }


    public static void main(String[] args) {
        Test healthchecker = new Test();
        healthchecker.healthchecker();
    }
}

