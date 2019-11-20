using System;
using WD.Data.Interfaces;

namespace WD.Data.Entities
{
    public class BaseEntity : IHistoryInfo
    {
        public Guid Id { get; set; }
        public DateTimeOffset CreatedDate { get; set; }
        public DateTimeOffset UpdatedDate { get; set; }
    }
}