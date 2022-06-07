using System.Web.Mvc;

namespace MayAnhPho
{
    public class MayAnhPhoAreaRegistration : AreaRegistration 
    {
        public override string AreaName 
        {
            get 
            {
                return "MayAnhPho";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context) 
        {
            context.MapRoute(
                "MayAnhPho_default",
                "MayAnhPho{controller}/{action}/{id}",
                new { action = "Index", id = UrlParameter.Optional }
            );
        }
    }
}