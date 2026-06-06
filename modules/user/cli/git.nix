{
    programs.git = {
        enable = true;

        settings = {
            user = {
                name = "indlns";
                email = "theindlns@gmail.com";
            };
        
        credential = {
            helper = "store";
            };
        };
    };
}