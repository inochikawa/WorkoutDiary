using System;

namespace WD.Data.Interfaces
{
    public interface IHistoryInfo
    {
        DateTimeOffset CreatedDate { get; set; }
        DateTimeOffset UpdatedDate { get; set; }
    }
}