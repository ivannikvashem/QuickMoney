//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Bank.Model
{
    using System;
    using System.Collections.Generic;
    
    public partial class Payment
    {
        public int PaymentID { get; set; }
        public int ServiceClientID { get; set; }
        public string Amount { get; set; }
        public System.DateTime Date { get; set; }
        public string CurPayStatus { get; set; }
    
        public virtual ServiceClient ServiceClient { get; set; }
    }
}
