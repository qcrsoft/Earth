using System;
using System.ComponentModel.DataAnnotations.Schema;

[Table("Manager")]
public class Manager
{
    public int Id { get; set; }
    [DatabaseGenerated(DatabaseGeneratedOption.Computed)]
    public DateTime Timemark { get; set; }
    public int Enabled { get; set; }
    public string Name { get; set; }
    public string Username { get; set; }
    public string Password { get; set; }
    public int IsSys { get; set; }
}