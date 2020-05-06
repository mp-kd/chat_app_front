Feature: Sign Up
  I should be able to sign up in order to use Chatapp

  Scenario: I wrote unique username and email and specified password and then I see sign up confirmation
    Given I am not currently logged in
    And I am on "sign up" page
    And I see "signupform" on screen
    When I fill the "usernamefield" field with "msatro"
    And I fill in "emailfield" with "satersifen@gmail.com"
    And I fill in "passwordfield" with "zaq1@WSX"
    And I fill in "repeatpasswordfield" with "zaq1@WSX"
    And I tick "termsofservice" checkbox
    And I tap "signupbutton" button
    Then I see "signupconfirmationalert" on screen