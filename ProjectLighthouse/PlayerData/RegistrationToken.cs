using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using LBPUnion.ProjectLighthouse.PlayerData.Profiles;

namespace LBPUnion.ProjectLighthouse.PlayerData
{
    public class RegistrationToken
    {
        [Key]
        public int TokenId { get; set; }

        public string Token { get; set; }

        #nullable enable
        public int? UserId {get; set; }

        [ForeignKey("UserId")]
        public User? User {get; set; }

        #nullable disable

        public DateTime Created { get; set; }
    }
}

