using System;
using System.ComponentModel.DataAnnotations;

namespace WD.Data.Entities
{
    public class ExerciseLoop : BaseEntity
    {
        public int Repeats { get; set; }
        public int Weight { get; set; }
        [Required] public Guid ExerciseId { get; set; }
        public Exercise Exercise { get; set; }
    }
}