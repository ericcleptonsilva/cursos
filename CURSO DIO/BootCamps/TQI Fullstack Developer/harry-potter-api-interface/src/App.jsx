import React from "react";
import GlobalStyle from "./global/globalStyles";
import ResetCss  from "./global/resetCss";
import Layout from "./components/Layout";

import TabPanel  from "./components/TabPanel";
import {ProviderHarryPotter} from "./providers/provider-harry-potter";

export const App = () => { 
  return(
    <main>
    <ProviderHarryPotter>
      <ResetCss />
      <GlobalStyle />
      <Layout >
     
       <TabPanel />
      </Layout>
    </ProviderHarryPotter>      
    </main>
  );
}
