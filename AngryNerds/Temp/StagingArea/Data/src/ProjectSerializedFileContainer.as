
package
{
        import flash.utils.ByteArray;
        import flash.utils.Dictionary;
        import flash.utils.Endian;
        import UnityEngine.*;
		import com.unity.SerializedFileContainer;

        public class ProjectSerializedFileContainer extends SerializedFileContainer
        {
                
        [Embed("/Users/yosun_mbpr15/AngryNerds/Temp/StagingArea/Data/mainData_txt", mimeType="application/octet-stream")]
        private var mainData:Class;

        [Embed("/Users/yosun_mbpr15/AngryNerds/Temp/StagingArea/Data/Resources/unity default resources_txt", mimeType="application/octet-stream")]
        private var Resources_unity_default_resources:Class;

        [Embed("/Users/yosun_mbpr15/AngryNerds/Temp/StagingArea/Data/resources.assets_txt", mimeType="application/octet-stream")]
        private var resources_assets:Class;

        [Embed("/Users/yosun_mbpr15/AngryNerds/Temp/StagingArea/Data/sharedassets0.assets_txt", mimeType="application/octet-stream")]
        private var sharedassets0_assets:Class;

     
       public function ProjectSerializedFileContainer()
       {
              files = new Dictionary();
files["mainData"] = new mainData() as ByteArray
fileSizes["mainData"] = 18348
files["Resources/unity default resources"] = new Resources_unity_default_resources() as ByteArray
fileSizes["Resources/unity default resources"] = 2417517
files["resources.assets"] = new resources_assets() as ByteArray
fileSizes["resources.assets"] = 2074956
files["sharedassets0.assets"] = new sharedassets0_assets() as ByteArray
fileSizes["sharedassets0.assets"] = 1157364
}	}
}
