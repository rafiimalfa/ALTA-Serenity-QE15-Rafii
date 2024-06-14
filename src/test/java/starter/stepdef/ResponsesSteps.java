package starter.stepdef;

import io.cucumber.java.en.And;
import io.cucumber.java.en.Then;
import net.serenitybdd.rest.SerenityRest;
import starter.reqres.ReqresAPI;
import starter.reqres.ReqresResponses;
import starter.utils.Constants;
import io.restassured.module.jsv.JsonSchemaValidator;

import java.io.File;

import static org.hamcrest.Matchers.equalTo;

public class ResponsesSteps {
    ReqresAPI reqresAPI;

    @Then("Status code should be {int}")
    public void statusCodeShouldBe(int statusCode) {
        SerenityRest.then().statusCode(statusCode);
    }

    @And("Response body page should be {int}")
    public void responseBodyPageShouldBePage(int page) {
        SerenityRest.and().body(ReqresResponses.PAGE, equalTo(page));
    }


    @And("Validate json schema {string}")
    public void validateJsonSchema(String fileName) {
        File jsonFile = new File(Constants.JSON_SCHEMA+fileName);
        SerenityRest.and().body(JsonSchemaValidator.matchesJsonSchema(jsonFile));
    }

    @And("Response body name should be {string} and job should be {string}")
    public void responseBodyNameShouldBeAndJobShouldBe(String name, String job) {
        SerenityRest.and().body(ReqresResponses.NAME, equalTo(name)).body(ReqresResponses.JOB, equalTo(job));
    }
}
