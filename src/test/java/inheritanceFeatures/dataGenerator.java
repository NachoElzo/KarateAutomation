package inheritanceFeatures;

import com.github.javafaker.Faker;

import net.minidev.json.JSONObject;

public class dataGenerator {
    // Fix the code importing javafaker
    public static String getRandomEmail() {
        Faker faker = new Faker();
        //faker.random returns random values 0-100
        String email = faker.name().firstName().toLowerCase() + faker.random().nextInt(0,100) + "@test.com";
        return email;
    }
    public static String getRandomUsername() {
        Faker faker = new Faker();
        String username = faker.name().username();
        return username;
    }
    //Creating a function that put values in a file
    //function gameOfThrones  generates string values for movies descriptions 
    //You can fit gameOfThrones from fake and put it as a random dummy data
    //Returns a json objects for the json file
    public static JSONObject getRandomArticlesValues() {
        Faker faker = new Faker();
        String title = faker.gameOfThrones().character();
        String description = faker.gameOfThrones().city();
        String body = faker.gameOfThrones().quote();
        JSONObject json = new JSONObject();
        json.put ("title",title);
        json.put ("description",description);
        json.put ("body",body);
        return json;
    }
}
