{
  pkgs,
  userConfig,
  ...
}:
let
  inherit (userConfig.paths) downloads;
in
{
  programs.freetube = {
    enable = true;
    package = pkgs.freetube;
    settings = {
      # Main settings
      checkForBlogPosts = false;
      checkForUpdates = false;
      currentLocale = "en-US";

      generalAutoLoadMorePaginatedItemsEnabled = true;
      landingPage = "subscriptions";
      listType = "grid";

      disableSmoothScrolling = false;

      # Theme
      baseTheme = "catppuccinMocha";
      mainColor = "Blue";
      barColor = false;
      expandSideBar = false;

      # Downloads
      downloadAskPath = false;
      downloadBehavior = "download";
      downloadFolderPath = downloads;

      # Hide items
      hideActiveSubscriptions = false;
      hideChannelShorts = true;
      hideHeaderLogo = true;
      hideLabelsSideBar = true;
      hidePlaylists = false;
      hidePopularVideos = true;
      hideSubscriptionsCommunity = false;
      hideSubscriptionsShorts = true;
      hideTrendingVideos = true;

      # Video settings
      allowDashAv1Formats = true;
      proxyVideos = false;
      useRssFeeds = true;

      autoplayPlaylists = false;
      autoplayVideos = false;

      externalPlayer = "";

      defaultInterval = 10;
      defaultQuality = "1080";
      defaultSkipInterval = 10;
      defaultTheatreMode = false;

      # Misc
      blurThumbnails = false;

      externalLinkHandling = "openLinkAfterPrompt";

      onlyShowLatestFromChannel = true;
      quickBookmarkTargetPlaylistId = "favorites";
      thumbnailPreference = "";

      videoPlaybackRateMouseScroll = false;
      videoVolumeMouseScroll = false;
    };
  };
}
