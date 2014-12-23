using System.Net;
using TestStack.BDDfy.Core;

[TestFixture]
[Story(
        Title ="Integration tests for Octopus Deploy",
        AsA = "As a developer",
        IWant = "I want the Octopus Deploy service to be reachable",
        SoThat = "So that I can create a release")]
public class OctopusDeployApiConnectionTests {
    private HttpStatusCode responseStatus = HttpStatusCode.ServiceUnavailable;
    private OctopusService service;

    public void GivenTheServiceIsInstantiated() {
        service = new OctopusService();
    }

    public void WhenTryingToConnectToTheOctopusService(){
        try {
            var request = (HttpWebRequest)WebRequest.Create(service.ApiUrl);
            request.Timeout = 1000;
            using (var response = (HttpWebResponse)request.GetResponse()) {
                using (var responseStream = response.GetResponseStream()) {
                    responseStatus = response.StatusCode;
                    Console.WriteLine("Response from url {0} ok. ", service.ApiUrl);
                }
            }
        }
        catch (WebException ex) {
            if (ex.Status == WebExceptionStatus.ProtocolError && ex.Response != null) {
                var resp = (HttpWebResponse)ex.Response;
                responseStatus = resp.StatusCode;
            }
        }

    }

    public void ThenTheServiceShouldReturnAuthorizedAccessStatus(){
        Assert.IsNotNull(responseStatus);
        Assert.AreEqual(HttpStatusCode.OK, responseStatus);
    }

    [Test]
    public void Execute() {
        this.BDDfy();
    }
}
