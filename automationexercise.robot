*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}                                https://automationexercise.com/
${brower}                             Chrome
${locator_btnSignupLogin}             xpath=/html/body/header/div/div/div/div[2]/div/ul/li[4]
${locator_name}                       xpath=/html/body/section/div/div/div[3]/div/form/input[2]
${locator_email}                      xpath=/html/body/section/div/div/div[3]/div/form/input[3]
${locator_btnsignup}                  xpath=//*[@id="form"]/div/div/div[3]/div/form/button
${locator_Title}                      title
${locator_name2}                      xpath=/html/body/section/div/div/div/div[1]/form/div[2]/input
${locator_password}                   xpath=/html/body/section/div/div/div/div[1]/form/div[4]/input
${locator_Day}                        xpath=/html/body/section/div/div/div/div[1]/form/div[5]/div/div[1]/div/select
${locator_Day-list}                   xpath=/html/body/section/div/div/div/div[1]/form/div[5]/div/div[1]/div/select/option[6]
${locator_Month}                      id=months
${locator_Month-list}                 xpath=/html/body/section/div/div/div/div[1]/form/div[5]/div/div[2]/div/select/option[4]
${locator_Year}                       id=years
${locator_Year-list}                  xpath=/html/body/section/div/div/div/div[1]/form/div[5]/div/div[3]/div/select/option[29]
${locator_chk-news}                   id=newsletter
${locator_chk-specialoffer}           id=optin
${locator_Firstname}                  id=first_name
${locator_Lastname}                   id=last_name
${locator_Company}                    id=company
${locator_address}                    id=address1
${locator_address2}                   id=address2
${locator_Country}                    id=country
${locator_Country-list}               xpath=/html/body/section/div/div/div/div[1]/form/p[6]/select/option[3]
${locator_State}                      id=state
${locator_City}                       id=city
${locator_Zipcode}                    id=zipcode
${locator_MobileNumber}               id=mobile_number
${locator_btnCreate}                  xpath=/html/body/section/div/div/div/div[1]/form/button
${locator_btn_Continue}               xpath=/html/body/section/div/div/div/div/a
${locator_Hyperlink-deleteaccout}     xpath=/html/body/header/div/div/div/div[2]/div/ul/li[5]/a
${locator_btn_Continueafterdelete}    xpath=/html/body/section/div/div/div/div/a
${locator_Emaillogin}                 xpath=//*[@id="form"]/div/div/div[1]/div/form/input[2]
${locator_Passwordlogin}              name=password
${locator_login}                      xpath=/html/body/section/div/div/div[1]/div/form/button
${locator_btnlogout}                  xpath=/html/body/header/div/div/div/div[2]/div/ul/li[4]/a

*** Keywords ***
Open webbrower
    Set Selenium Speed            0.5s
    Open Browser        ${url}    ${brower}
    Wait Until Page Contains      AutomationExercise    3s
    Maximize Browser Window


*** Test Cases ***
TC001 - Register User and Delete Account
    Open webbrower 
    Click Element                                    ${locator_btnSignupLogin}
    Wait Until Page Contains                                                    New User Signup!
    Input Text                                       ${locator_name}            wisarut chuduang
    Input Text                                       ${locator_email}           wisarut.chud@gmail.com
    Click Element                                    ${locator_btnsignup}
    Wait Until Page Contains                                                    Enter Account Information
    Select Radio Button                              ${locator_Title}           Mr
    Input Text                                       ${locator_password}        123456789
    Click Element                                    ${locator_Day}
    Wait Until Element Is Visible                    ${locator_Day-list}        5s
    Click Element                                    ${locator_Day-list}  
    Click Element                                    ${locator_Month}
    Wait Until Element Is Visible                    ${locator_Month-list}      5s
    Click Element                                    ${locator_Month-list} 
    Click Element                                    ${locator_Year}
    Wait Until Element Is Visible                    ${locator_Year-list}       5s
    Click Element                                    ${locator_Year-list}   
    Select Checkbox                                  ${locator_chk-news}
    Select Checkbox                                  ${locator_chk-specialoffer}
    Input Text                                       ${locator_Firstname}       wisarut
    Input Text                                       ${locator_Lastname}        Chuduang
    Input Text                                       ${locator_Company}         ABC Company
    Input Text                                       ${locator_address}         777
    Input Text                                       ${locator_address2}        Building A
    Click Element                                    ${locator_Country}
    Wait Until Element Is Visible                    ${locator_Country-list}    5s
    Click Element                                    ${locator_Country-list}  
    Input Text                                       ${locator_State}           Toronto
    Input Text                                       ${locator_City}            City of Toronto
    Input Text                                       ${locator_Zipcode}         416M
    Input Text                                       ${locator_Mobile_number}   0836480441
    Click Element                                    ${locator_btnCreate}
    Wait Until Page Contains                                                    Account Created!           3s
    Click Element                                    ${locator_btn_Continue}
    Wait Until Page Contains                                                    Logged in        5s
   

TC002 - Login User with correct email and password
    [Tags]     done
    Open webbrower
    Click Element                                    ${locator_btnSignupLogin}
    Wait Until Page Contains                                                    New User Signup!   3s
    Input Text                                       ${locator_Emaillogin}      wisarut.chud@gmail.com
    Input Text                                       ${locator_Passwordlogin}   123456789
    Click Element                                    ${locator_login}
    Close Browser

TC003 - Login User with incorrect email and password
    
    Open webbrower
    Click Element                                    ${locator_btnSignupLogin}
    Wait Until Page Contains                                                    Login to your account
    Input Text                                       ${locator_Emaillogin}      wisarut@gmail.com 
    Input Text                                       ${locator_Passwordlogin}   987654321
    Click Element                                    ${locator_login}
    Wait Until Page Contains                                                    Your email or password is incorrect!    5s
    Close Browser

TC004 - Logout User
    
    Open webbrower
    Click Element                                    ${locator_btnSignupLogin}
    Wait Until Page Contains                                                    Login to your account   3s
    Input Text                                       ${locator_Emaillogin}      wisarut.chud@gmail.com
    Input Text                                       ${locator_Passwordlogin}   123456789
    Click Element                                    ${locator_login}
    Wait Until Page Contains                                                    Logged in        3s
    Click Element                                    ${locator_btnlogout}
    Wait Until Page Contains                                                    Login to your account    3s
    Close Browser

TC005 - Register User with existing email
    [Tags]  done1
    Open webbrower
    Click Element                                    ${locator_btnSignupLogin}
    Wait Until Page Contains                                                    New User Signup!   3s
    Input Text                                       ${locator_name}            wisarut chuduang
    Input Text                                       ${locator_email}           wisarut.chud@gmail.com
    Click Element                                    ${locator_btnsignup}
    Wait Until Page Contains                                                    Email Address already exist!    3s
    Close Browser




