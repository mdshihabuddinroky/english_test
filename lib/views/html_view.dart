import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

// Define the SideBarView widget
class SideBarView extends StatelessWidget {
  // Constructor for the SideBarView widget
  const SideBarView({
    // Key for the widget
    super.key,
    // Required title for the app bar
    this.title,
  });

  // Private member for storing the title
  final title;

  // Build method for the widget
  @override
  Widget build(BuildContext context) {
    // Return a Scaffold widget with an app bar and a body
    return Scaffold(
      // Set the app bar for the Scaffold
      appBar: AppBar(
        // Set the icon theme to use black icons
        iconTheme: const IconThemeData(color: Colors.black),
        // Set the app bar's elevation to 0
        elevation: 0,
        // Set the background color of the app bar to white
        backgroundColor: Colors.white,
        // Center the title in the app bar
        centerTitle: true,
        // Set the title of the app bar to be the title passed to the constructor
        title: Text(
          title,
          // Use the Roboto font for the title text with a font size of 20
          // and set the color to black
          style: GoogleFonts.roboto(fontSize: 20, color: Colors.black),
        ),
      ),
      // Set the body of the Scaffold to a SingleChildScrollView widget
      // with a child set to an HtmlWidget
      body: SingleChildScrollView(
          child: HtmlWidget(
        // Set the HTML content of the HtmlWidget to the value in the "html" map
        // with the key set to the title passed to the constructor
        html[title]!,
        // Add padding of 10 on all sides to the HtmlWidget
      ).paddingAll(10)),
    );
  }
}

// sidebar privacy policy terms & condtion are stored here
var html = {
  "Privacy Policy": """<p><strong>Privacy Policy</strong></p>

<p>1 Absolute built the Spellicious app as an Ad Supported app. This SERVICE is provided by 1 Absolute at no cost and is intended for use as is.</p>

<p>This page is used to inform visitors regarding our policies regarding the collection, use, and disclosure of Personal Information if anyone decided to use our Service.</p>

<p>If you choose to use our Service, then you agree to the collection and use of information in relation to this policy. The Personal Information that we collect is used for providing and improving the Service. We will not use or share your information with anyone except as described in this Privacy Policy.</p>

<p>The terms used in this Privacy Policy have the same meanings as in our Terms and Conditions, which are accessible at Spellicious unless otherwise defined in this Privacy Policy.</p>

<p><strong>Information Collection and Use</strong></p>

<p>For a better experience, while using our Service, we may require you to provide us with certain personally identifiable information. The information that we request will be retained by us and used as described in this privacy policy.</p>

<p>The app does use third-party services that may collect information used to identify you.</p>

<p>Link to the privacy policy of third-party service providers used by the app</p>

<ul>
	<li>Google Play Services</li>
</ul>

<p><strong>Log Data</strong></p>

<p>We want to inform you that whenever you use our Service, in a case of an error in the app we collect data and information (through third-party products) on your phone called Log Data. This Log Data may include information such as your device Internet Protocol (&ldquo;IP&rdquo;) address, device name, operating system version, the configuration of the app when utilizing our Service, the time and date of your use of the Service, and other statistics.</p>

<p><strong>Cookies</strong></p>

<p>Cookies are files with a small amount of data that are commonly used as anonymous unique identifiers. These are sent to your browser from the websites that you visit and are stored on your device&#39;s internal memory.</p>

<p>This Service does not use these &ldquo;cookies&rdquo; explicitly. However, the app may use third-party code and libraries that use &ldquo;cookies&rdquo; to collect information and improve their services. You have the option to either accept or refuse these cookies and know when a cookie is being sent to your device. If you choose to refuse our cookies, you may not be able to use some portions of this Service.</p>

<p><strong>Service Providers</strong></p>

<p>We may employ third-party companies and individuals due to the following reasons:</p>

<ul>
	<li>To facilitate our Service;</li>
	<li>To provide the Service on our behalf;</li>
	<li>To perform Service-related services; or</li>
	<li>To assist us in analyzing how our Service is used.</li>
</ul>

<p>We want to inform users of this Service that these third parties have access to their Personal Information. The reason is to perform the tasks assigned to them on our behalf. However, they are obligated not to disclose or use the information for any other purpose.</p>

<p><strong>Security</strong></p>

<p>We value your trust in providing us your Personal Information, thus we are striving to use commercially acceptable means of protecting it. But remember that no method of transmission over the internet, or method of electronic storage is 100% secure and reliable, and we cannot guarantee its absolute security.</p>

<p><strong>Links to Other Sites</strong></p>

<p>This Service may contain links to other sites. If you click on a third-party link, you will be directed to that site. Note that these external sites are not operated by us. Therefore, we strongly advise you to review the Privacy Policy of these websites. We have no control over and assume no responsibility for the content, privacy policies, or practices of any third-party sites or services.</p>

<p><strong>Children&rsquo;s Privacy</strong></p>

<p>These Services do not address anyone under the age of 13. We do not knowingly collect personally identifiable information from children under 13 years of age. In the case we discover that a child under 13 has provided us with personal information, we immediately delete this from our servers. If you are a parent or guardian and you are aware that your child has provided us with personal information, please contact us so that we will be able to do the necessary actions.</p>

<p><strong>Changes to This Privacy Policy</strong></p>

<p>We may update our Privacy Policy from time to time. Thus, you are advised to review this page periodically for any changes. We will notify you of any changes by posting the new Privacy Policy on this page.</p>

<p>This policy is effective as of 2022-11-19</p>

<p><strong>Contact Us</strong></p>

<p>If you have any questions or suggestions about our Privacy Policy, do not hesitate to contact us at Shahir Naga.</p>

<p>This privacy policy page was created at&nbsp;privacypolicytemplate.net&nbsp;and modified/generated by&nbsp;App Privacy Policy Generator</p>

<p>&nbsp;</p>
""",
  "Terms & Condition": """<p><strong>Terms &amp; Conditions</strong></p>

<p>By downloading or using the app, these terms will automatically apply to you &ndash; you should make sure therefore that you read them carefully before using the app. You&rsquo;re not allowed to copy or modify the app, any part of the app, or our trademarks in any way. You&rsquo;re not allowed to attempt to extract the source code of the app, and you also shouldn&rsquo;t try to translate the app into other languages or make derivative versions. The app itself, and all the trademarks, copyright, database rights, and other intellectual property rights related to it, still belong to 1 Absolute.</p>

<p>&nbsp;</p>

<p>1 Absolute is committed to ensuring that the app is as useful and efficient as possible. For that reason, we reserve the right to make changes to the app or to charge for its services, at any time and for any reason. We will never charge you for the app or its services without making it very clear to you exactly what you&rsquo;re paying for.</p>

<p>&nbsp;</p>

<p>The Spellicious app stores and processes personal data that you have provided to us, to provide our Service. It&rsquo;s your responsibility to keep your phone and access to the app secure. We therefore recommend that you do not jailbreak or root your phone, which is the process of removing software restrictions and limitations imposed by the official operating system of your device. It could make your phone vulnerable to malware/viruses/malicious programs, compromise your phone&rsquo;s security features and it could mean that the Spellicious app won&rsquo;t work properly or at all.</p>

<p>The app does use third-party services that declare their Terms and Conditions.</p>

<p>Link to Terms and Conditions of third-party service providers used by the app</p>

<ul>
	<li>Google Play Services</li>
</ul>

<p>You should be aware that there are certain things that 1 Absolute will not take responsibility for. Certain functions of the app will require the app to have an active internet connection. The connection can be Wi-Fi or provided by your mobile network provider, but 1 Absolute cannot take responsibility for the app not working at full functionality if you don&rsquo;t have access to Wi-Fi, and you don&rsquo;t have any of your data allowance left.</p>

<p>&nbsp;</p>

<p>If you&rsquo;re using the app outside of an area with Wi-Fi, you should remember that the terms of the agreement with your mobile network provider will still apply. As a result, you may be charged by your mobile provider for the cost of data for the duration of the connection while accessing the app, or other third-party charges. In using the app, you&rsquo;re accepting responsibility for any such charges, including roaming data charges if you use the app outside of your home territory (i.e. region or country) without turning off data roaming. If you are not the bill payer for the device on which you&rsquo;re using the app, please be aware that we assume that you have received permission from the bill payer for using the app.</p>

<p>Along the same lines, 1 Absolute cannot always take responsibility for the way you use the app i.e. You need to make sure that your device stays charged &ndash; if it runs out of battery and you can&rsquo;t turn it on to avail the Service, 1 Absolute cannot accept responsibility.</p>

<p>With respect to 1 Absolute&rsquo;s responsibility for your use of the app, when you&rsquo;re using the app, it&rsquo;s important to bear in mind that although we endeavor to ensure that it is updated and correct at all times, we do rely on third parties to provide information to us so that we can make it available to you. 1 Absolute accepts no liability for any loss, direct or indirect, you experience as a result of relying wholly on this functionality of the app.</p>

<p>&nbsp;</p>

<p>At some point, we may wish to update the app. The app is currently available on Android &amp; iOS &ndash; the requirements for the both systems(and for any additional systems we decide to extend the availability of the app to) may change, and you&rsquo;ll need to download the updates if you want to keep using the app. 1 Absolute does not promise that it will always update the app so that it is relevant to you and/or works with the Android &amp; iOS version that you have installed on your device. However, you promise to always accept updates to the application when offered to you, We may also wish to stop providing the app, and may terminate use of it at any time without giving notice of termination to you. Unless we tell you otherwise, upon any termination, (a) the rights and licenses granted to you in these terms will end; (b) you must stop using the app, and (if needed) delete it from your device.</p>

<p>&nbsp;</p>

<p><strong>Changes to This Terms and Conditions</strong></p>

<p>We may update our Terms and Conditions from time to time. Thus, you are advised to review this page periodically for any changes. We will notify you of any changes by posting the new Terms and Conditions on this page.</p>

<p>These terms and conditions are effective as of 2022-11-19</p>

<p>&nbsp;</p>

<p><strong>Contact Us</strong></p>

<p>If you have any questions or suggestions about our Terms and Conditions, do not hesitate to contact us at Shahir Naga.</p>

<p>This Terms and Conditions page was generated by&nbsp;App Privacy Policy Generator</p>

<p>&nbsp;</p>
""",
  "About us": """<p><strong>About Us</strong></p>

<p>&nbsp;</p>

<p>1 Absolute is an Australian-based education company that focuses on the creation of innovative educational concepts for training, and personal and professional development.</p>

<p>Our services and training span elementary, middle, and university English teaching, vocational, adult, and higher education training.</p>

<p>&nbsp;</p>

<p>Our websites are:</p>

<p><a href="https://www.faster-english.com">www.faster-english.com</a></p>

<p><a href="https://www.spellicious.com">www.spellicious.com</a></p>

<p>&nbsp;</p>

<p>&nbsp;</p>
"""
};
