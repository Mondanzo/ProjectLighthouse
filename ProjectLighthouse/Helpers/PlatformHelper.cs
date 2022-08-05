namespace LBPUnion.ProjectLighthouse.PlayerData;

public enum NetworkPlatform {
    PSN,
    RPCN,
}

public static class PlatformHelper {
    public static NetworkPlatform? GetNetworkFromPlatform(Platform platform)
    {
        switch(platform){
            case Platform.PS3:
            case Platform.Vita:
            case Platform.PSP:
                return NetworkPlatform.PSN;
            case Platform.RPCS3:
                return NetworkPlatform.RPCN;
            default:
                return null;
        }
    }
}