using System.Collections.Generic;

namespace WD.Data.Entities
{
    public class Training : BaseEntity
    {
        public List<Exercise> Exercises { get; set; }
    }
}