package suite {
  
  import flexunit.framework.TestSuite;  
  
  public class AllTests extends TestSuite {
    
    public function AllTests() {
      super();
      // Add tests here
      // For examples, see: http://code.google.com/p/as3flexunitlib/wiki/Resources
      addTest( MediaTypeTest.suite()            );
      addTest( W3CDTFTest.suite()               );
      addTest( WSSEUsernameTokenTest.suite()    );
      addTest( AtomNamespaceTest.suite()        );
      addTest( AtomElementTest.suite()          );
      addTest( AtomLinkTest.suite()             );
      addTest( AtomPersonTest.suite()           );
      addTest( AtomGeneratorTest.suite()        );
      addTest( AtomCategoryTest.suite()         );
      addTest( AtomCategoriesTest.suite()       );
      addTest( AtomCollectionTest.suite()       );
      addTest( AtomWorkspaceTest.suite()        );
      addTest( AtomServiceTest.suite()          );
      addTest( AtomControlTest.suite()          );
      addTest( AtomContentTest.suite()          );
      addTest( AtomEntryTest.suite()            );
      addTest( AtomFeedTest.suite()             );
      addTest( AtomMediaTypeTest.suite()        );
      addTest( AtompubCacheTest.suite()         );
      addTest( AtompubClientTest.suite()        );
    }
    
  }
  
}

