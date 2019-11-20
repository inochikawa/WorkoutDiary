using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace WD.Data.Entities
{
    public class Exercise : BaseEntity
    {
        public string Name { get; set; }
        public List<ExerciseLoop> Loops { get; set; }
        [Required] public Guid TrainingId { get; set; }
        public Training Training { get; set; }
    }
}