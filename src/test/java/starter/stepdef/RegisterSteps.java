package starter.stepdef;

import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.When;
import net.serenitybdd.rest.SerenityRest;
import net.thucydides.core.annotations.Steps;
import starter.reqres.ReqresAPI;
import starter.reqres.ReqresResponses;
import starter.utils.Constants;
import static org.hamcrest.Matchers.equalTo;
import java.io.File;

public class RegisterSteps {
    @Steps
    ReqresAPI reqresAPI;

    @When("Send request post register user")
    public void sendRequestPostRegisterUser() {
        SerenityRest.when().post(ReqresAPI.USER_REGISTER);
    }

    @Given("User register with file json {string}")
    public void userRegisterWithFileJson(String fileName) {
        File fileJson = new File(Constants.REQ_BODY+fileName);
        reqresAPI.postUserRegister(fileJson);
    }

    @And("Response body email should be {string} and password should be {string}")
    public void responseBodyEmailShouldBeAndPasswordShouldBe(String email, String password) {
        SerenityRest.and().body(ReqresResponses.EMAIL_REGISTER, equalTo(email)).body(ReqresResponses.PASSWORD, equalTo(password));
    }
}
