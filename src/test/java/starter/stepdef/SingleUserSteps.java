package starter.stepdef;

import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.When;
import net.serenitybdd.rest.SerenityRest;
import net.thucydides.core.annotations.Steps;
import starter.reqres.ReqresAPI;
import starter.reqres.ReqresResponses;
import starter.utils.Constants;
import io.restassured.module.jsv.JsonSchemaValidator;

import java.io.File;

import static org.hamcrest.Matchers.equalTo;

public class SingleUserSteps {
    @Steps
    ReqresAPI reqresAPI;

    @Given("Get single user with parameter {int}")
    public void getSingleUserWithParameterId(int id) {
        reqresAPI.getsingleuser(id);
    }

    @When("Send request get single user")
    public void sendRequestGetSingleUser() {
        SerenityRest.when().get(ReqresAPI.SINGLE_USER);
    }


    @And("Response body id should be {int} and email should be {string}")
    public void responseBodyIdShouldBeBodyidAndEmailShouldBe(int bodyid, String email) {
        SerenityRest.and().body(ReqresResponses.ID, equalTo(bodyid)).body(ReqresResponses.EMAIL, equalTo(email));

    }

    @And("Response body notfound should be {string}")
    public void responseBodyIdShouldBe(String id) {
        SerenityRest.and().body(equalTo(id));
    }

    @Given("Get single user with parameter {string}")
    public void getSingleUserWithParameter(String id) {
        reqresAPI.getsingleuserstring(id);
    }

//    @And("Response body notfount should be {string}")
//    public void responseBodyNotfountShouldBe(String fileName) {
//        File jsonFile = new File(Constants.JSON_SCHEMA+fileName);
//        SerenityRest.and().body(JsonSchemaValidator.matchesJsonSchema(jsonFile));
//    }
}
