package starter.reqres;

import io.restassured.http.ContentType;
import net.serenitybdd.rest.SerenityRest;
import net.thucydides.core.annotations.Step;
import starter.utils.Constants;

import java.io.File;

public class ReqresAPI {
    public static String LIST_USERS = Constants.BASE_URL + "/api/users?page={page}";
    public static String CREATE_USER = Constants.BASE_URL + "/api/users";
    public static String USER_WITH_IDs = Constants.BASE_URL + "/api/users/{idUser}";
    public static String LOGIN_SUCCESS = Constants.BASE_URL + "/api/login";
    public static String USER_REGISTER = Constants.BASE_URL + "/api/register";
    public static String SINGLE_USER = Constants.BASE_URL + "/api/users/{id}";


    @Step("Get list users")
    public void getListUsers(int page) {
        SerenityRest.given().pathParam("page", page);
    }

    @Step("Create new user")
    public void postCreateNewUser(File json) {
        SerenityRest.given()
                .contentType(ContentType.JSON)
                .body(json);
    }

    @Step("Update user")
    public void putAndPatchUpdateUser(int id, File json) {
        SerenityRest.given()
                .pathParam("idUser", id)
                .contentType(ContentType.JSON)
                .body(json);
    }

    @Step("Delete a user")
    public void deleteUser(int id) {
        SerenityRest.given()
                .pathParam("idUser", id);
    }

    @Step("Login success")
    public void postLoginSuccess(File json) {
        SerenityRest.given().contentType(ContentType.JSON).body(json);
    }

    @Step("User register")
    public void postUserRegister(File json) {
        SerenityRest.given().contentType(ContentType.JSON).body(json);
    }

    @Step("Delete a user")
    public void deleteUserSpecialCharacter(String id) {
        SerenityRest.given()
                .pathParam("idUser", id);

    }
    @Step("Get Single User")
    public void getsingleuser(int id){
        SerenityRest.given().pathParam("id", id);
    }
    @Step("get Single User String Id")
    public void getListUsersString(String page){
        SerenityRest.given()
                .pathParam("page", page);
    }
    @Step("Get Single User String")
    public void getsingleuserstring(String id){
        SerenityRest.given().pathParam("id", id);
    }


}
