*** Settings ***
Documentation  This is a test suite that tests the car booking website for Infotiv.
Library  SeleniumLibrary
Test Setup  Begin Test
Test Teardown  End Test

*** Variables ***
${BROWSER}        chrome

*** Keywords ***
Begin Test
        Open Browser                about:blank  ${BROWSER}
        Maximize Browser Window
        Load Page
        Verify Page Loaded

Load Page
        Go To                       http://rental8.infotiv.net/
Verify Page Loaded
        Wait Until Page Contains        Infotiv Car Rental

End Test
        Close Browser

That User is on Car selection page
    Click Button                    id:continue
User is not logged
    Wait Until Element Is Visible   id:email
    Wait Until Element Is Visible   id:password
User books a car
    Click Button                    xpath://*[@id="bookQ7pass5"]
An error message should show
    Alert Should Be Present         text=You need to be logged in to continue.


Is logged in
    Input Text                  id:email     ahmad.audi@iths.se
    Input Password              id:password  testPassword
    Click Button                id:login
User is in Successful booking page
    #Choose date
    Click Button                id:continue
    #Verify that Car booking page is loaded
    Wait Until Page Contains   What would you like to drive?
    #Book a car
    Click Button               xpath://*[@id="bookQ7pass5"]
    #Verify that page is loaded
    Wait Until Page Contains    Confirm booking of
    #Fill credit card details
    Input Text                  id:cardNum  1111111111111111
    Input Text                  id:fullName  Ahmad Audi
    Select From List By Label   xpath://select[@title="Month"]  4
    Select From List By Label   xpath://select[@title="Year"]   2022
    Input Text                  id:cvc  323
    #Send credit card details
    Click Button                id:confirm
    #Verify that page is loaded
    Wait Until Page Contains    is now ready for pickup
User clicks on Home button
    Click Button                id:home
User should see the home page
    Wait Until Page Contains    When do you want to make your trip?
    #Clean process
    Click Button                id:mypage
    Wait Until Page Contains    My bookings
    Click Button                id:unBook1
    Handle Alert                action=ACCEPT
    #Verify that page is loaded
    Wait Until Page Contains    has been Returned

*** Test Cases ***
Access website
    [Documentation]             Test for accessing website infotiv
    [Tags]                      Access_test
    #Test website connection
    Wait Until Page Contains    ABOUT

Test login function with valid credentials
    [Documentation]             test login with valid credentials
    [Tags]                      testValidLogin
    #Input login credentials
    Input Text                  id:email     ahmad.audi@iths.se
    Input Password              id:password  testPassword
    #Login
    Click Button                id:login
    #Verify login
    Wait Until Page Contains    You are signed in as Ahmad

Test login function with invalid credentials
    [Documentation]             test login with valid credentials
    [Tags]                      testInvalidLogin
    #Input login credentials
    Input Text                  id:email     test
    Input Password              id:password  password
    #Login
    Click Button                id:login
    #Verify login
    Wait Until Element Is Visible     id:signInError

Test invaild dates in date selection
    [Documentation]             test date selection with invalid booking dates
    [Tags]                      testInvalidBookingDates
    #Input invalid dates
    Input Text                  id:end  05-25
    #Login
    Click Button                id:continue
    #Verify login
    Wait Until Element Is Visible  css:#end:invalid

Test authorization when booking
    [Documentation]             test that it is requiered to login when booking
    [Tags]                      testAuthBooking
    Given That User is on Car selection page
    And User is not logged
    When User books a car
    Then An error message should show

Test booking a car and reset
    [Documentation]             test that booking a car works and reset system
    [Tags]                      testBookingCar
    #Login
    Input Text                  id:email    ahmad.audi@iths.se
    Input Text                  id:password     testPassword
    Click Button                id:login
    #Choose date
    Click Button                id:continue
    #Verify that Car booking page is loaded
    Wait Until Page Contains   What would you like to drive?
    #Book a car
    Click Button               xpath://*[@id="bookQ7pass5"]
    #Verify that page is loaded
    Wait Until Page Contains    Confirm booking of
    #Fill credit card details
    Input Text                  id:cardNum  1111111111111111
    Input Text                  id:fullName  Ahmad Audi
    Select From List By Label   xpath://select[@title="Month"]  4
    Select From List By Label   xpath://select[@title="Year"]   2022
    Input Text                  id:cvc  323
    #Send credit card details
    Click Button                id:confirm
    #Verify that page is loaded
    Wait Until Page Contains    is now ready for pickup
    #Go to my page
    Click Button                id:mypage
    #Verify that page is loaded
    Wait Until Page Contains    My bookings
    #Unbook car
    Click Button                id:unBook1
    Handle Alert                action=ACCEPT
    #Verify that page is loaded
    Wait Until Page Contains    has been Returned

Test if Home button works
    [Documentation]             Test if Home Button Works in Successful booking page
    [Tags]                      VG_test
    Given Is logged in
    And User is in Successful booking page
    When User clicks on Home button
    Then User should see the home page