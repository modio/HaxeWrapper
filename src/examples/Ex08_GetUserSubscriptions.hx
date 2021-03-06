import ModioWrapper;

class Ex08_GetUserSubscriptions
{
  static function main()
  {
    var finished = false;

    var wait = function()
    {
      while (finished == false)
      {
        ModioWrapper.process();
        Sys.sleep(.017);
      }
    }

    var finish = function()
    {
      finished = true;
    }

    ModioWrapper.init(ModioWrapper.ENVIRONMENT_TEST, 7, "e91c01b8882f4affeddd56c96111977b", "");

    // Before requesting mods, let's define the query filters
    // Other sorting types available are: SORT_BY_ID, SORT_BY_DATE_LIVE and SORT_BY_DATE_UPDATED
    ModioWrapper.getUserSubscriptions(function(response:Dynamic, mods:Array<Dynamic>)
    {
      trace("Response code: " + response.code);
      if(response.code == 200)
      {
        for (i in 0...mods.length)
        {
          trace("Id: " + mods[i].id);
          trace("Name: " + mods[i].name);
          trace("Description: " + mods[i].description_plaintext + "\n");
        }
        finish();
      }
    });
    
    wait();
  }
}