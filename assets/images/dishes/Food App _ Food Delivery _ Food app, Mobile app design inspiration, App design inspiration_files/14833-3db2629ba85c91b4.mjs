(self.__LOADABLE_LOADED_CHUNKS__=self.__LOADABLE_LOADED_CHUNKS__||[]).push([[14833],{128833:(e,t,n)=>{n.d(t,{fv:()=>v,Mv:()=>m,uc:()=>u,dL:()=>l,qS:()=>g,Y4:()=>h,HE:()=>y,Cy:()=>w});var r=n(667294),a=n(973935),o=n(241933),i=n(24309);function s(e,t,n){return t in e?Object.defineProperty(e,t,{value:n,enumerable:!0,configurable:!0,writable:!0}):e[t]=n,e}class c extends r.Component{constructor(...e){super(...e),s(this,"observe",(()=>{try{if(this.node=(0,a.findDOMNode)(this),this.node instanceof HTMLElement){const{pinIdStr:e,newsIdStr:t}=this.props.eventData;o.ZP.start(this.node).onExitViewport(this.logImpression).setDebugId(e||t||"unknown")}}catch(e){window.console.error('Can only track impressions for type "HTMLElement"')}})),s(this,"logImpression",(e=>{(0,i.vP)({viewData:this.props.viewData||{},viewType:this.props.viewType,viewParameter:this.props.viewParameter,eventType:this.props.eventType,impressionType:this.props.impressionType,auxData:this.props.auxData,component:this.props.component,objectIdStr:this.props.objectIdStr,eventData:{endTime:e.endTime,time:e.startTime,...this.props.eventData}}),this.props.onTracked&&this.props.onTracked(this.props.eventData)}))}componentDidMount(){this.props.isPaused||this.observe()}componentDidUpdate(e){e.isPaused&&!this.props.isPaused&&this.observe()}componentWillUnmount(){this.node instanceof HTMLElement&&o.ZP.stop(this.node)}render(){return r.Children.only(this.props.children)}}function d({auxData:e,component:t,eventData:n,eventType:a,impressionType:s,isPaused:c,objectIdStr:d,onTracked:p,viewData:l,viewType:m,viewParameter:u}){const v=(0,r.useRef)(null),g=r=>{(0,i.vP)({viewData:l||{},viewType:m,viewParameter:u,eventType:a,impressionType:s,auxData:e,component:t,objectIdStr:d,eventData:{endTime:r.endTime,time:r.startTime,...n}}),p&&p(n)},w=(0,r.useCallback)((()=>{try{if(v.current instanceof HTMLElement){const{pinIdStr:e,newsIdStr:t}=n;o.ZP.start(v.current).onExitViewport(g).setDebugId(e||t||"unknown")}}catch(e){window.console.error('Can only track impressions for type "HTMLElement"')}}),[v.current]);(0,r.useEffect)((()=>(c||w(),()=>{v.current instanceof HTMLElement&&o.ZP.stop(v.current)})),[w]);const y=(0,r.useRef)(c);return(0,r.useEffect)((()=>{y.current&&!c&&w(),y.current=c}),[c,w]),v}var p=n(785893);const l=e=>(0,p.jsx)(c,{eventData:{...e.impressionData||{},pinIdStr:e.loggingId,clientTrackingParams:e.trackingParams,slotIndex:e.slotIndex},auxData:e.auxData||{},component:e.component,eventType:18,impressionType:"pinImpressions",isPaused:e.isPaused,loggingId:e.loggingId,objectIdStr:e.objectIdStr,onTracked:e.onTracked,viewData:e.viewData,viewType:e.viewType||1,viewParameter:e.viewParameter,children:e.children}),m=e=>{const t=d({eventData:{newsIdStr:e.notificationId,newsType:e.newsType,displayMode:e.displayMode,newsIndex:e.newsIndex||0,tapItemIdStr:e.tapItemIdStr},auxData:e.auxData||{},eventType:4111,impressionType:"notificationDetailImpressions",loggingId:e.notificationId,viewType:107,viewParameter:3082});return e.children({impressionTrackerRef:t})},u=e=>{const t=d({eventData:{newsIdStr:e.notificationId,newsType:e.newsType},auxData:e.auxData||{},eventType:4110,impressionType:"notificationFeedImpressions",loggingId:e.notificationId,viewType:107,viewParameter:3081});return e.children({impressionTrackerRef:t})},v=e=>(0,p.jsx)(c,{eventData:{...e.impressionData||{},articleIdStr:e.loggingId,clientTrackingParams:e.trackingParams,slotIndex:e.slotIndex},auxData:e.auxData||{},component:e.component,eventType:3829,impressionType:"articleImpressions",isPaused:e.isPaused,loggingId:e.loggingId,objectIdStr:e.objectIdStr,onTracked:e.onTracked,viewData:e.viewData,viewType:e.viewType||1,viewParameter:e.viewParameter,children:e.children}),g=e=>(0,p.jsx)(c,{eventData:{...e.impressionData||{},storyIdStr:e.loggingId,clientTrackingParams:e.trackingParams,slotIndex:e.slotIndex},auxData:e.auxData||{},component:e.component,eventType:170,impressionType:"storyImpressions",isPaused:e.isPaused,loggingId:e.loggingId,objectIdStr:e.objectIdStr,onTracked:e.onTracked,viewData:e.viewData,viewType:e.viewType||1,viewParameter:e.viewParameter,children:e.children}),w=e=>{const t=d({eventData:{...e.impressionData||{},userIdStr:e.loggingId,clientTrackingParams:e.trackingParams,slotIndex:e.slotIndex||0},auxData:e.auxData||{},component:e.component,eventType:3704,impressionType:"userImpressions",isPaused:e.isPaused,loggingId:e.loggingId,objectIdStr:e.objectIdStr,onTracked:e.onTracked,viewData:e.viewData,viewType:e.viewType||1,viewParameter:e.viewParameter});return e.children({impressionTrackerRef:t})},y=e=>{const t=d({eventData:{...e.impressionData||{},topicIdStr:e.loggingId,clientTrackingParams:e.trackingParams,slotIndex:e.slotIndex||0},auxData:e.auxData||{},component:e.component,eventType:3703,impressionType:"topicImpressions",isPaused:e.isPaused,loggingId:e.loggingId,objectIdStr:e.objectIdStr,onTracked:e.onTracked,viewData:e.viewData,viewType:e.viewType,viewParameter:e.viewParameter});return e.children({impressionTrackerRef:t})},h=e=>{const t=d({eventData:{...e.impressionData||{},clientTrackingParams:e.trackingParams,slotIndex:e.slotIndex},auxData:e.auxData||{},component:e.component,eventType:8569,impressionType:"todayArticleImpressions",isPaused:e.isPaused,loggingId:e.loggingId,objectIdStr:e.objectIdStr,onTracked:e.onTracked,viewData:e.viewData,viewType:e.viewType||1,viewParameter:e.viewParameter});return e.children({impressionTrackerRef:t})}},156993:(e,t,n)=>{n.d(t,{Z:()=>l});var r=n(667294),a=n(40142),o=n(618446),i=n.n(o),s=n(604744),c=n(561613);var d=n(785893);class p extends r.Component{componentDidMount(){const{setCurrentPageData:e,viewData:t,viewParameter:n,viewType:r}=this.props;e({viewData:t,viewParameter:n,viewType:r})}componentDidUpdate(e){const{setCurrentPageData:t,viewData:n,viewParameter:r,viewType:a}=this.props;r===e.viewParameter&&a===e.viewType&&i()(n,e.viewData)||t({viewData:n,viewParameter:r,viewType:a})}componentWillUnmount(){this.props.clearCurrentPageData()}render(){const{auxData:e,children:t,component:n,objectIdStr:r,viewData:a,viewParameter:o,viewType:i,clientTrackingParams:c}=this.props;return(0,d.jsx)(s.Z,{auxData:e,component:n,objectIdStr:r,clientTrackingParams:c,viewData:a,viewParameter:o,viewType:i,children:t})}}const l=(0,a.connect)(null,(function(e){return{clearCurrentPageData:()=>e({type:c.jn}),setCurrentPageData:t=>{return e((n=t,{type:c.QA,payload:n}));var n}}}))(p)},604744:(e,t,n)=>{n.d(t,{Z:()=>s});var r=n(667294),a=n(641483),o=n(24309);const i=({viewType:e,viewParameter:t,viewData:n,auxData:r,objectIdStr:i,component:s,clientTrackingParams:c,element:d})=>{const p=(l={event_type:13,view_type:e,view_parameter:t,view_data:n,aux_data:r,object_id_str:i,component:s,clientTrackingParams:c,element:d},Object.keys(l).reduce(((e,t)=>(void 0!==l[t]&&(e[t]=l[t]),e)),{}));var l;-1===Object.keys(p).indexOf("view_type")&&(0,a.ZP)("mweb.logging.null_view_type"),(0,o.j)(p)};function s(e){const{auxData:t,clientTrackingParams:n,children:a,component:o,element:s,objectIdStr:c,viewData:d,viewParameter:p,viewType:l}=e;return(0,r.useEffect)((()=>{i(e)}),[JSON.stringify(t),n,o,s,c,JSON.stringify(d),p,l]),r.Children.only(a)}},911506:(e,t,n)=>{n.d(t,{i:()=>c,Z:()=>d});var r=n(40142),a=n(883119),o=n(971887),i=n(18236),s=n(785893);const c=({children:e,dataLayoutShiftBoundaryId:t,devicePlatform:n="",hasFixedHeader:r=!1,hasGutter:c=!0,useViewport:d=!1,showKeychainError:p=!1})=>{const l=(0,i.jd)(n)?i.Vf:0;return(0,s.jsx)(a.xu,{"data-layout-shift-boundary-id":t||"PageContainer",height:d?`calc(100vh - ${l}px)`:void 0,paddingX:c?o.q3:void 0,paddingY:r||p?void 0:3,children:(0,s.jsx)(o.CK,{value:!!c,children:e})})},d=(0,r.connect)((({session:e})=>({devicePlatform:e.userAgentPlatform})))(c)},971887:(e,t,n)=>{n.d(t,{q3:()=>a,CK:()=>i,VG:()=>s});var r=n(667294);const a=2,o=(0,r.createContext)(!1),i=o.Provider,s=()=>(0,r.useContext)(o)},414653:(e,t,n)=>{n.d(t,{Z:()=>i});var r=n(942334),a=n(354864),o=n(785893);const i=e=>(0,o.jsx)(a.CQ,{...e,timeSpentManager:r.Z})},942334:(e,t,n)=>{n.d(t,{Z:()=>s});var r=n(354864),a=n(221469),o=n(24309);const i=!!(0,a.mB)(window.location.search).debug_timespent,s=(0,r.wM)({flushEvents:o.NJ,shouldShowLogStatements:i,track:o.j})},442975:(e,t,n)=>{n.d(t,{XM:()=>d,U2:()=>u,bi:()=>v,v_:()=>g});var r=n(731164),a=n(502709),o=n(311866),i=n(301314),s=n(561613),c=n(782677);const d=(e,t,n,r)=>({type:s.AF,payload:{resource:e,options:t,response:n,normalizedResponse:r}}),p=(e,t,n)=>({type:s.cR,payload:{resource:e,options:t,error:n}}),l=(e,{bookmark:t,options:n,schema:r})=>{const o=r||a.Z[e];return"function"==typeof o?o({resource:e,options:n,bookmark:t}):o},m=(e,t,n)=>a=>{const{bookmark:d,headers:u,options:v,refresh:g,schema:w}=t,y=n?n.bookmark:d,h=y?{...v,bookmarks:[y]}:v;return a(((e,t,n)=>({type:s.KK,payload:{resource:e,options:t,isFetching:n}}))(e,v,!0)),o.ZP.create(e,h).callGet(void 0,u).then((o=>{let s=o.resource_response.data;if("number"==typeof s||s){const[p]=o.bookmarks||[];if(Array.isArray(s)&&0===s.length&&p&&"-end-"!==p){const o=n?n.count:0,i=o>=10;if(r.Z.increment("mweb.resource_empty_data_retry",1,{name:e,retry:o,maxRetryReached:i}),!i)return a(m(e,t,{count:o+1,bookmark:p}))}"ExploreArticleResource"===e&&(s.id=v.story_id,s.objects.forEach((e=>{e.article_id=v.story_id}))),"VisualSearchFlashlightUnifiedResource"===e&&(s=s.results);const u=l(e,{bookmark:d,options:v,schema:w}),y=u?(0,c.Fv)(s,u):null;a(d?(0,i.D)(e,v,o,y,u):(0,i.S)(e,v,o,y,g,u))}return Promise.resolve()}),(t=>{a(p(e,v,t))}))},u=(e,{bookmark:t,headers:n,options:r,schema:a})=>m(e,{bookmark:t,headers:n,options:r,refresh:!1,schema:a}),v=(e,{headers:t,options:n,schema:r})=>m(e,{headers:t,options:n,refresh:!0,schema:r}),g=(e,t)=>n=>{const{options:r,schema:a}=t;return o.ZP.create(e,r).callCreate().then((t=>{if(t.resource_response.data){const o=t.resource_response.data,i=a?(0,c.Fv)(o,a):null;n(d(e,r,t,i))}return t}),(t=>(n(p(e,r,t)),t)))}},155656:(e,t,n)=>{n.d(t,{Z:()=>o});n(441143);var r=n(785893);class a{static factory(e){return e instanceof a?e:new a(String(e))}constructor(e){this._private_safe_value=e.trim().replace(">",">").replace("<","<").replace("&","&").replace('"','"').replace("'","'")}toString(){return this._private_safe_value}}function o(e){const{css:t,unsafeCSS:n,...o}=e,i=String(t||"")||n||"";return!!i?(0,r.jsx)("style",{...o,dangerouslySetInnerHTML:{__html:String(a.factory(i))}}):null}},292900:(e,t,n)=>{n.d(t,{Z:()=>s});var r=n(667294),a=n(731164),o=n(372833);function i(e,t,n){return t in e?Object.defineProperty(e,t,{value:n,enumerable:!0,configurable:!0,writable:!0}):e[t]=n,e}class s extends r.Component{constructor(...e){super(...e),i(this,"state",{error:null,info:null}),i(this,"resetError",(()=>{this.setState({error:null,info:null})}))}componentDidCatch(e,t){try{const t=this.props.name,n=this.props.type||"secondary";(0,o.B)({errorBoundary:t,errorBoundaryType:n,message:e.message,name:e.name,stack:e.stack}),a.Z.increment("react.error_boundary",.1,{component:void 0,name:this.props.name})}catch(n){a.Z.increment("react.error_boundary.error",1,{name:this.props.name})}this.setState({error:e,info:t})}render(){const{renderErrorState:e}=this.props,{error:t,info:n}=this.state;return t&&n?e?e({error:t,info:n,resetError:this.resetError}):null:this.props.children}}},551687:(e,t,n)=>{n.d(t,{Z:()=>r});const r=n(292900).Z},151101:(e,t,n)=>{n.d(t,{Z:()=>i});var r=n(883119),a=n(785893);const o=(e,t)=>{const n=null==e?void 0:e.includes("images/user/default");return Boolean(n&&t)};function i({accessibilityLabel:e,name:t,outline:n,size:i,src:s,verified:c}){return(0,a.jsx)(r.qE,{accessibilityLabel:e,name:t,outline:n,size:i,src:o(s,t)?void 0:s,verified:c})}},18236:(e,t,n)=>{n.d(t,{Rq:()=>r,Vf:()=>a,jd:()=>o,oy:()=>i});const r=e=>"ios"===e&&(window.devicePixelRatio||1)*window.screen.height==2436,a=28,o=e=>window.innerHeight>=748&&r(e),i=function(){return!("undefined"==typeof window||!window.navigator)&&(/iPad/.test(navigator.platform)||navigator.maxTouchPoints>1&&"MacIntel"===navigator.platform)}},301314:(e,t,n)=>{n.d(t,{S:()=>a,D:()=>o});var r=n(447715);function a(e,t,n,a,o,i){return{type:r.z,payload:{isRefresh:o,normalizedResponse:a,options:t,resource:e,response:n,schema:i}}}function o(e,t,n,a,o){return{type:r.a,payload:{resource:e,options:t,response:n,normalizedResponse:a,schema:o}}}},372833:(e,t,n)=>{n.d(t,{B:()=>o,Z:()=>i});var r=n(704170);const a=[];function o(e){let t;try{t=JSON.stringify({errorObj:e})}catch(s){t=JSON.stringify({errorObj:{message:e.message,name:"logToServer stringify exception"}})}const n=(o={report_context:JSON.stringify({current_url:window.location.href,client_version:"64fd4a2"}),report_data:t},Object.keys(o).map((e=>e+"="+encodeURIComponent(o[e]))).join("&"));var o;const i=window.btoa(n);if(-1===a.indexOf(i)){const e=new XMLHttpRequest;e.open("post","/_/_/report/error/",!0),e.setRequestHeader("Content-type","application/x-www-form-urlencoded");const t=(0,r.H)();t&&e.setRequestHeader("X-Pinterest-PWS-Handler",t),e.setRequestHeader("X-CSRFToken",function(e){const t=("; "+document.cookie).split("; "+e+"=");return 2===t.length?t.pop().split(";").shift():""}("csrftoken")),e.send(n),a.push(i)}a.length>100&&a.shift()}function i(){window.addEventListener("error",(e=>{const t=e.error||{};o({name:t.name,message:t.message||e.message,stack:t.stack,filename:e.filename,line:e.lineno,column:e.colno})})),window.addEventListener("unhandledrejection",(e=>{var t,n,r,a,i;if(!((null==e?void 0:e.reason)instanceof Error))return;const{reason:s}=e,c="string"==typeof(null==s?void 0:s.message)?s.message:String(s);o({name:null!==(t=null==s?void 0:s.name)&&void 0!==t?t:"unhandledrejection",message:c,message_detail:null==s?void 0:s.message_detail,original_message:null==s?void 0:s.original_message,stack:null==s?void 0:s.stack,filename:null==s?void 0:s.fileName,line:null!==(n=null!==(r=null==s?void 0:s.lineno)&&void 0!==r?r:null==s?void 0:s.line)&&void 0!==n?n:null==s?void 0:s.lineNumber,column:null!==(a=null!==(i=null==s?void 0:s.column)&&void 0!==i?i:null==s?void 0:s.colno)&&void 0!==a?a:null==s?void 0:s.columnNumber})}))}}}]);
//# sourceMappingURL=https://sm.pinimg.com/webapp/14833-3db2629ba85c91b4.mjs.map